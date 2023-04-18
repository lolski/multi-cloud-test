module "aws" {
    source = "./modules/aws"
    // resource-group = var.project-id
    resource-prefix = var.resource-prefix
    cluster-version = var.cluster-version
    fleet-project-id = var.project-id
    fleet-region = var.fleet-region
    region = var.aws-region
    subnet-az = var.aws-subnet-az
    control_plane_instance_type = var.aws-control-plane-instance-type
    node_pool_instance_type = var.aws-node-pool-instance-type
    admins = var.aws-admins
}

module "gcp" {
    source = "./modules/gcp"

    project-id = var.project-id
    resource-prefix = var.resource-prefix
    cluster-version = var.cluster-version

    placement = {
        region = var.gcp.placement.region
        AZs = var.gcp.placement.AZs
    }

    instances = {
        type = var.gcp.instances.type
        count = {
            min = var.gcp.instances.count.min
            max = var.gcp.instances.count.max
        }
    }

    service-account = {
        file = var.gcp.service-account.file
        name = var.gcp.service-account.name
    }
}
