variable "project" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "region" {
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

variable "credentials_file" {
  type = string
}

variable "gcp_service_account_name" {
  type = string
}

variable "log_retention_days" {
  type = number
}
