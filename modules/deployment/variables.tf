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

variable "project" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "zone" {
  type = string
}

variable "min_nodes" {
  type = number
}

variable "max_nodes" {
  type = number
}

variable "machine_type" {
  type = string
}

variable "auto_repair" {
  type = bool
}

variable "auto_upgrade" {
  type = bool
}

variable "gcp_service_account_name" {
  type = string
}

variable "log_retention_days" {
  type = number
}

variable "region" {
  type = string
}

variable "credentials_file" {
  type = string
}

variable "ssh_private_key_file" {
  type = string
}