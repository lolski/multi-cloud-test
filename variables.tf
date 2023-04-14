variable "namespace" {
  description = "Prefix to apply to all artifacts created."
  type        = string
}

variable "fleet-gke-version" {
  description = "GKE version to install"
  type        = string
}

variable "fleet-project-id" {
  description = "Enter the project id of the gcp project where the cluster will be registered."
  type        = string
}

variable "fleet-region" {
  description = "GCP location to deploy to"
  type        = string
}

#####
# AWS
#####

# This step sets up the default RBAC policy in your cluster for a Google
# user so you can login after cluster creation
variable "aws-admin-users" {
  description = "User to get default Admin RBAC"
  type        = list(string)
}

variable "aws-region" {
  description = "AWS region to deploy to"
  type        = string
}

variable "aws-subnet-az" {
  description = "Availability zones to create subnets in, np will be created in the first"
  type        = list(string)
}

variable "aws-control-plane-instance-type" {
  description = "AWS Node instance type"
  type        = string
}

variable "aws-node-pool-instance-type" {
  description = "AWS Node instance type"
  type        = string
}

#####
# GCP
#####

variable "project" {
  type = string
  description = "Project ID"
}

variable "cluster_name" {
  type = string
  description = "Name of the GKE cluster. Must contain only lowercase letters, numbers or hyphens. Must be no more than 25 symbols long."
}

variable "zone" {
  type = string
  description = "Zone for the GKE cluster."
}

variable "min_nodes" {
  type = number
  description = "The initial amount of nodes in the GKE Cluster. May increase through auto-scaling."
}

variable "max_nodes" {
  type = number
  description = "The maximum number of nodes that the GKE Cluster can auto-scale to."
}

variable "machine_type" {
  type = string
  description = "Type of the GKE cluster machines, as per https://cloud.google.com/compute/docs/machine-types"
}

variable "auto_repair" {
  type = bool
  description = "Whether nodes should auto-repair, as determined by https://cloud.google.com/kubernetes-engine/docs/how-to/node-auto-repair"
}

variable "auto_upgrade" {
  type = bool
  description = "Whether nodes should auto-upgrade when the control plane is updated, as per https://cloud.google.com/kubernetes-engine/docs/how-to/node-auto-upgrades"
}

variable "gcp_service_account_name" {
  type = string
  description = "The name attached to the GCP Service Account. This is the local-part of the Service Account email - i.e. the part before the '@'."
}

variable "log_retention_days" {
  type = number
  description = "The amount of days that logs are held in the created log bucket."
}

variable "region" {
  type = string
  description = "Region for the VPC network."
}

variable "credentials_file" {
  type = string
  description = "Location of the credentials JSON file."
}

variable "ssh_private_key_file" {
  type = string
  description = "Location of the SSH Private Key file for ArgoCD."
}