data "kubectl_file_documents" "namespace" {
  content = templatefile(
    "${path.module}/workload-identity/namespace.yaml",
    {
      namespace = var.workload_id_namespace
    }
  )
}

data "kubectl_file_documents" "service_account" {
  content = templatefile(
    "${path.module}/workload-identity/service-account.yaml",
    {
      name = var.workload_id_kubernetes_sa
      namespace = var.workload_id_namespace
      gcp_service_account_email = "${var.gcp_service_account_name}@${var.project}.iam.gserviceaccount.com"
    }
  )
}

resource "kubectl_manifest" "namespace" {
  count     = length(data.kubectl_file_documents.namespace.documents)
  yaml_body = element(data.kubectl_file_documents.namespace.documents, count.index)
}

resource "kubectl_manifest" "service_account" {
  depends_on = [
    kubectl_manifest.namespace,
  ]
  count     = length(data.kubectl_file_documents.service_account.documents)
  yaml_body = element(data.kubectl_file_documents.service_account.documents, count.index)
}

module "workload-identity" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  # declare dependencies using 'module_depends_on' as opposed to 'depends_on'
  # (see https://github.com/terraform-google-modules/terraform-google-gcloud/issues/82#issuecomment-881504950)
  module_depends_on = [
    kubectl_manifest.service_account
  ]

  project_id = var.project
  location = var.region
  cluster_name = google_container_cluster.primary.name
  name = var.workload_id_kubernetes_sa
  use_existing_gcp_sa = true
  use_existing_k8s_sa = true
  gcp_sa_name = var.gcp_service_account_name
  k8s_sa_name = var.workload_id_kubernetes_sa
  namespace = var.workload_id_namespace
  roles = [
    "roles/iam.workloadIdentityUser"
  ]
  automount_service_account_token = true

}
