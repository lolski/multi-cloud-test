module "application" {
  source = "./modules/application"

  project-id = var.project-id
  resource-prefix = "${var.resource-prefix}-app"
  cluster-version = var.cluster-version

  fleet = {
    project-id = var.project-id
    region = var.application.placement.region
  }

  placement = {
    region = var.application.placement.region
    AZs = var.application.placement.AZs
  }

  instances = {
    count = {
      min = var.application.instances.count.min
      max = var.application.instances.count.max
    }
    type = var.application.instances.type
  }

  service-account = {
    file = var.gcp.service-account.file
    name = var.gcp.service-account.name
  }
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
