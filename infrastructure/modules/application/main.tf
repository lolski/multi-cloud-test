module "gcp" {
  source = "./modules/gcp"

  project = var.project
  resource_prefix = var.resource_prefix
  region = var.region
  zone = var.zone
  min_nodes = var.min_nodes
  max_nodes = var.max_nodes
  machine_type = var.machine_type
  workload_id_namespace = local.workload_id_namespace
  workload_id_kubernetes_sa = local.workload_id_kubernetes_sa
  docker_version = local.docker_version
  credentials_file = var.credentials_file
  typedb_cloud_server_app = var.typedb_cloud_server_app
  gcp_service_account_name = var.gcp_service_account_name
  log_retention_days = var.log_retention_days
}

module "argocd" {
  source = "./modules/argocd"

  gke_auth_host = module.gcp.gke_auth_host
  gke_auth_token = module.gcp.gke_auth_token
  gke_cluster_ca_certificate = module.gcp.gke_cluster_ca_certificate
  platform_deployment_repo = var.platform_deployment_repo
  ssh_private_key_file = var.ssh_private_key_file
  cluster_name              = module.gcp.gke_cluster_name
  project                   = var.project
  region                    = var.region
  kubernetes_service_account           = local.workload_id_kubernetes_sa
  kubernetes_service_account_namespace = local.workload_id_namespace
}

module "auth0" {
  source = "./modules/auth0"

  auth0_client_id = var.auth0_client_id
  auth0_client_secret = var.auth0_client_secret
  auth0_domain = var.auth0_domain
  dev_site = "https://${var.resource_prefix}.cloud.typedb.dev"
  name_prefix = var.resource_prefix
  default_users_emails = var.default_users_emails
  cloudflare_ready = module.cloudflare.is_record_ready
}

module "cloudflare" {
  source = "./modules/cloudflare"

  api_token = var.cloudflare_api_token
  cloudflare_zone_id = var.cloudflare_zone_id
  auth0_verification_address = module.auth0.auth0_verification_address
  custom_login_domain = "login.${var.resource_prefix}.cloud"
}
