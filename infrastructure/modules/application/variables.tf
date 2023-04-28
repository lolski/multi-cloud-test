####################
# Global variables #
####################
variable "project" {
    type = string
    description = "Project ID"
}

#####################
# Cluster variables #
#####################
variable "resource_prefix" {
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

variable "typedb_cloud_server_app" {
    type = string
    description = "Name of the ArgoCD Service in which the typedb-cloud server is run. Used to identify logs that come from the typedb-cloud server."
}

variable "log_retention_days" {
    type = number
    description = "The amount of days that logs are held in the created log bucket."
}

#########################
# VPC Network variables #
#########################
variable "region" {
    type = string
    description = "Region for the VPC network."
}

###########################
# Configuration variables #
###########################
variable "credentials_file" {
    type = string
    description = "Location of the credentials JSON file."
}

variable "ssh_private_key_file" {
    type = string
    description = "Location of the SSH Private Key file for ArgoCD."
}

variable "platform_deployment_repo" {
    type = string
    description = "Name of the GitHub repository that specifies the ArgoCD configuration. Must be of the form <github user>/<repo title>"
}

###################
# Auth0 Variables #
###################

variable "auth0_domain" {
    type = string
    description = "Terraform Auth0 Provider Domain"
}

variable "auth0_client_id" {
    type = string
    description = "Terraform Auth0 Provider Client ID"
}

variable "auth0_client_secret" {
    type = string
    description = "Terraform Auth0 Provider Client Secret"
    sensitive = true
}

variable "default_users_emails" {
    type = list(string)
    default = []
}

########################
# Cloudflare Variables #
########################

variable "cloudflare_zone_id" {
    type = string
    description = "The Cloudflare zone ID to manage objects in"
}

variable "cloudflare_api_token" {
    type = string
    description = "A Cloudflare API Token to authenticate the management of objects"
}
