module "application" {
  source = "./modules/application"
  auth0_client_id = var.application.providers.auth0.client-id
  auth0_client_secret = var.application.providers.auth0.client-secret
  auth0_domain = var.application.providers.auth0.domain
  auto_repair = true
  auto_upgrade = true
  cloudflare_api_token = var.application.providers.cloudflare.api-token
  cloudflare_zone_id = var.application.providers.cloudflare.zone-id
  resource_prefix = var.resource-prefix
  credentials_file = var.gcp.service-account.file
  gcp_service_account_name = var.gcp.service-account.name
  log_retention_days = var.application.log-retention-days
  machine_type = var.application.instances.type
  max_nodes = var.application.instances.count.max
  min_nodes = var.application.instances.count.min
  platform_deployment_repo = var.application.platform-deployment-repo
  project = var.project-id
  region = var.application.placement.region
  ssh_private_key_file = var.gcp.ssh-private-key-file
  typedb_cloud_server_app = var.application.typedb-cloud-server-app
  zone = var.application.placement.AZs[0]
}

module "deployment" {
  source = "./modules/deployment"

  resource-prefix = "${var.resource-prefix}-deploy"
  cluster-version = var.cluster-version

  fleet = {
    project-id = var.project-id
    region = var.application.placement.region
  }

  aws = {
    resource-group = var.project-id
    admins = var.deployment.aws.admins
  }

  gcp = {
    project-id = var.project-id
    service-account = {
      file = var.gcp.service-account.file
      name = var.gcp.service-account.name
    }
    ssh-private-key-file = var.gcp.ssh-private-key-file
  }
}
