variable "project" {
  type = string
}

variable "resource_prefix" {
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

variable "workload_id_namespace" {
  type = string
}

variable "workload_id_kubernetes_sa" {
  type = string
}

variable "docker_version" {
  type = number
}

variable "credentials_file" {
  type = string
}

variable "gcp_service_account_name" {
  type = string
}

variable "typedb_cloud_server_app" {
  type = string
}

variable "log_retention_days" {
  type = number
}
