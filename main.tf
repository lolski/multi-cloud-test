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

  gcp-region = var.deployment-cluster-gcp-region
  gcp-az = var.deployment-cluster-gcp-az
  gcp-min-nodes = var.deployment-cluster-gcp-min-nodes
  gcp-max-nodes = var.deployment-cluster-gcp-max-nodes
  gcp-instance-type = var.deployment-cluster-gcp-instance-type
  gcp-credentials = var.deployment-cluster-gcp-credentials
  gcp-service-account-name = var.deployment-cluster-gcp-svc-acc-name
  gcp-ssh-private-key = var.deployment-cluster-gcp-ssh-private-key
}
