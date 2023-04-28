output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}

output "gke_auth_host" {
  value = module.gke_auth.host
}

output "gke_cluster_ca_certificate" {
  value = module.gke_auth.cluster_ca_certificate
}

output "gke_auth_token" {
  value = module.gke_auth.token
}

output "service_account_namespace" {
  value = var.workload_id_namespace
}
