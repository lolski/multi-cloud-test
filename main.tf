module "deployment" {
  source = "./modules/deployment"

  name_prefix = var.namespace
  cluster_version = var.fleet-gke-version
  gcp_project_id = var.fleet-project-id
  gcp_location = var.fleet-region

  admin_users = var.aws-admin-users
  aws_region = var.aws-region
  subnet_availability_zones = var.aws-subnet-az
  node_pool_instance_type = var.aws-node-pool-instance-type
  control_plane_instance_type = var.aws-control-plane-instance-type

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
