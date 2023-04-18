module "aws-eu-west-2" {
    source = "./modules/aws"

    // resource-group = var.aws.resource-group
    resource-prefix = "${var.resource-prefix}-eu-west-2"
    cluster-version = var.cluster-version
    fleet-project-id = var.fleet.project-id
    fleet-region = var.fleet.region
    region = "eu-west-2"
    subnet-az = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
    control_plane_instance_type = "t3.medium"
    node_pool_instance_type = "t3.medium"
    admins = var.aws.admins
}

module "gcp-europe-west2" {
    source = "./modules/gcp"

    project-id = var.gcp.project-id
    resource-prefix = "${var.resource-prefix}-europe-west2"
    cluster-version = var.cluster-version

    placement = {
        region = "europe-west2"
        AZs = ["europe-west2-a", "europe-west2-b"]
    }

    instances = {
        type = "e2-standard-8"
        count = {
            min = 0
            max = 100
        }
    }

    service-account = {
        file = var.gcp.service-account.file
        name = var.gcp.service-account.name
    }
}

module "gcp-us-west2" {
    source = "./modules/gcp"

    project-id = var.gcp.project-id
    resource-prefix = "${var.resource-prefix}-us-west2"
    cluster-version = var.cluster-version

    placement = {
        region = "us-west2"
        AZs = ["us-west2-a", "us-west2-b"]
    }

    instances = {
        type = "e2-standard-8"
        count = {
            min = 0
            max = 100
        }
    }

    service-account = {
        file = var.gcp.service-account.file
        name = var.gcp.service-account.name
    }
}