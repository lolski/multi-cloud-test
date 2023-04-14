variable "namespace" {
  type = string
}

variable "fleet-cluster-version" {
  type = string
}

variable "fleet-project-id" {
  type = string
}

variable "fleet-region" {
  type = string
}

variable "deployment-cluster-aws-admins" {
  type = list(string)
}

variable "deployment-cluster-aws-region" {
  type = string
}

variable "deployment-cluster-aws-subnet-az" {
  type = list(string)
}

variable "deployment-cluster-aws-node-pool-inst-type" {
  type = string
}

variable "deployment-cluster-aws-control-plane-inst-type" {
  type = string
}

variable "deployment-cluster-gcp-project-id" {
  type = string
}

variable "deployment-cluster-gcp-az" {
  type = string
}

variable "deployment-cluster-gcp-min-nodes" {
  type = number
}

variable "deployment-cluster-gcp-max-nodes" {
  type = number
}

variable "deployment-cluster-gcp-instance-type" {
  type = string
}

variable "deployment-cluster-gcp-sa-name" {
  type = string
}

variable "deployment-cluster-gcp-region" {
  type = string
}

variable "deployment-cluster-gcp-credentials" {
  type = string
}

variable "deployment-cluster-gcp-ssh-private-key" {
  type = string
}