module "aws" {
    source = "./modules/aws"
    namespace = var.namespace
    cluster-version = var.fleet-cluster-version
    fleet-project-id = var.fleet-project-id
    fleet-region = var.fleet-region
    region = var.deployment-cluster-aws-region
    subnet-az = var.deployment-cluster-aws-subnet-az
    node_pool_instance_type = var.deployment-cluster-aws-node-pool-inst-type
    control_plane_instance_type = var.deployment-cluster-aws-control-plane-inst-type
    admins = var.deployment-cluster-aws-admins
}

module "gcp" {
    source = "./modules/gcp"
    namespace = var.namespace
    project-id = var.deployment-cluster-gcp-project-id
    region = var.deployment-cluster-gcp-region
    az = var.deployment-cluster-gcp-az
    min-nodes = var.deployment-cluster-gcp-min-nodes
    max-nodes = var.deployment-cluster-gcp-max-nodes
    instance-type = var.deployment-cluster-gcp-instance-type
    credentials = var.deployment-cluster-gcp-credentials
    sa-name = var.deployment-cluster-gcp-sa-name
}
