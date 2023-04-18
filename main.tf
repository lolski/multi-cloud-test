module "application" {
  source = "./modules/application"
  project-id = var.project-id
  resource-prefix = "${var.resource-prefix}-application"
  cluster-version = var.cluster-version
  region = var.application-cluster-region
  az = var.application-cluster-az
  instance-type = var.application-cluster-instance-type
  min-nodes = var.application-cluster-min-nodes
  max-nodes = var.application-cluster-max-nodes
  credentials = var.application-cluster-credentials
  service-account-name = var.application-cluster-svc-acc-name
}

module "deployment" {
  source = "./modules/deployment"

  project-id = var.project-id
  resource-prefix = "${var.resource-prefix}-deployment"
  cluster-version = var.cluster-version

  fleet-region = var.fleet-region

  aws-region = var.deployment-cluster-aws-region
  aws-subnet-az = var.deployment-cluster-aws-subnet-az
  aws-node-pool-instance-type = var.deployment-cluster-aws-node-pool-inst-type
  aws-control-plane-instance-type = var.deployment-cluster-aws-control-plane-inst-type
  aws-admins = var.deployment-cluster-aws-admins

  gcp = {
    placement = {
      region = var.deployment.gcp.placement.region
      AZs = var.deployment.gcp.placement.AZs
    }

    instances = {
      type = var.deployment.gcp.instances.type
      count = {
        min = var.deployment.gcp.instances.count.min
        max = var.deployment.gcp.instances.count.max
      }
    }

    service-account = {
      file = var.deployment.gcp.service-account.file
      name = var.deployment.gcp.service-account.name
    }
    ssh-private-key-file = var.deployment.gcp.ssh-private-key-file
  }
}
