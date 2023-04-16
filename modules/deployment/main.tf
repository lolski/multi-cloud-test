module "aws" {
    source = "./modules/aws"
    // resource-group = var.project-id
    resource-prefix = var.resource-prefix
    cluster-version = var.cluster-version
    fleet-project-id = var.project-id
    fleet-region = var.fleet-region
    region = var.aws-region
    subnet-az = var.aws-subnet-az
    node_pool_instance_type = var.aws-node-pool-instance-type
    control_plane_instance_type = var.aws-control-plane-instance-type
    admins = var.aws-admins
}

module "gcp" {
    source = "./modules/gcp"
    project-id = var.project-id
    resource-prefix = var.resource-prefix
    cluster-version = var.cluster-version
    region = var.gcp-region
    az = var.gcp-az
    instance-type = var.gcp-instance-type
    min-nodes = var.gcp-min-nodes
    max-nodes = var.gcp-max-nodes
    credentials = var.gcp-credentials
    sa-name = var.gcp-service-account-name
}
