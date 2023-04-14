module "aws" {
    source = "./modules/aws"
    namespace = var.namespace
    cluster-version = var.fleet-cluster-version
    fleet-project-id = var.fleet-project-id
    gcp_location = var.fleet-region
    admins = var.deployment-cluster-aws-admins
    region = var.deployment-cluster-aws-region
    subnet-az = var.deployment-cluster-aws-subnet-az
    node_pool_instance_type = var.deployment-cluster-aws-node-pool-inst-type
    control_plane_instance_type = var.deployment-cluster-aws-control-plane-inst-type
}

module "gcp" {
    source = "./modules/gcp"

    project = var.project
    cluster_name = var.cluster_name
    region = var.region
    zone = var.zone
    min_nodes = var.min_nodes
    max_nodes = var.max_nodes
    machine_type = var.machine_type
    credentials_file = var.credentials_file
    gcp_service_account_name = var.gcp_service_account_name
    log_retention_days = var.log_retention_days
}
