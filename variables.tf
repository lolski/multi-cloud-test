variable "resource-prefix" {
  type = string
}

variable "project-id" {
  type = string
}

variable "fleet-region" {
  type = string
}

variable "cluster-version" {
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

variable "deployment-cluster-aws-control-plane-inst-type" {
  type = string
}

variable "deployment-cluster-aws-node-pool-inst-type" {
  type = string
}

variable "deployment-cluster-gcp-project-id" {
  type = string
}

variable "deployment-cluster-gcp-region" {
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

variable "deployment-cluster-gcp-svc-acc-name" {
  type = string
}

variable "deployment-cluster-gcp-credentials" {
  type = string
}

variable "deployment-cluster-gcp-ssh-private-key" {
  type = string
}