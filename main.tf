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

  deployment-cluster-gcp-project-id = var.deployment-cluster-gcp-project-id
  deployment-cluster-gcp-region = var.deployment-cluster-gcp-region
  deployment-cluster-gcp-az = var.deployment-cluster-gcp-az
  deployment-cluster-gcp-min-nodes = var.deployment-cluster-gcp-min-nodes
  deployment-cluster-gcp-max-nodes = var.deployment-cluster-gcp-max-nodes
  deployment-cluster-gcp-instance-type = var.deployment-cluster-gcp-instance-type
  deployment-cluster-gcp-credentials = var.deployment-cluster-gcp-credentials
  deployment-cluster-gcp-sa-name = var.deployment-cluster-gcp-svc-acc-name
  deployment-cluster-gcp-ssh-private-key = var.deployment-cluster-gcp-ssh-private-key
}
