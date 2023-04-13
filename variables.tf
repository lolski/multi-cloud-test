variable "name_prefix" {
  description = "Prefix to apply to all artifacts created."
  type        = string
}

variable "cluster_version" {
  description = "GKE version to install"
  type        = string
}

variable "gcp_project_id" {
  description = "Enter the project id of the gcp project where the cluster will be registered."
  type        = string
}

# Use the following command to identify the correct GCP location for a given AWS region
#gcloud container aws get-server-config --location [gcp-region]

variable "gcp_location" {
  description = "GCP location to deploy to"
  type        = string
}

# This step sets up the default RBAC policy in your cluster for a Google
# user so you can login after cluster creation
variable "admin_users" {
  description = "User to get default Admin RBAC"
  type        = list(string)
}

variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
}

#You will need 3 AZs, one for each control plane node
variable "subnet_availability_zones" {
  description = "Availability zones to create subnets in, np will be created in the first"
  type        = list(string)
}

variable "node_pool_instance_type" {
  description = "AWS Node instance type"
  type        = string
}

variable "control_plane_instance_type" {
  description = "AWS Node instance type"
  type        = string
}
