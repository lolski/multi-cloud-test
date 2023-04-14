module "deployment" {
  source = "./modules/deployment"

  namespace = var.namespace
  fleet-project-id = var.fleet-project-id
  fleet-region = var.fleet-region
  fleet-cluster-version = var.fleet-cluster-version

  deployment-cluster-aws-region = var.deployment-cluster-aws-region
  deployment-cluster-aws-subnet-az = var.deployment-cluster-aws-subnet-az
  deployment-cluster-aws-admins = var.deployment-cluster-aws-admins
  deployment-cluster-aws-node-pool-inst-type = var.deployment-cluster-aws-node-pool-inst-type
  deployment-cluster-aws-control-plane-inst-type = var.deployment-cluster-aws-control-plane-inst-type

  auto_repair = var.auto_repair
  auto_upgrade = var.auto_upgrade
  cluster_name = var.cluster_name
  credentials_file = var.credentials_file
  gcp_service_account_name = var.gcp_service_account_name
  log_retention_days = var.log_retention_days
  machine_type = var.machine_type
  max_nodes = var.max_nodes
  min_nodes = var.min_nodes
  project = var.project
  region = var.region
  ssh_private_key_file = var.ssh_private_key_file
  zone = var.zone
}
