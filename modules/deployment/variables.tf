variable "project-id" {
  type = string
}

variable "resource-prefix" {
  type = string
}

variable "fleet-region" {
  type = string
}

variable "cluster-version" {
  type = string
}

variable "aws-admins" {
  type = list(string)
}

variable "aws-region" {
  type = string
}

variable "aws-subnet-az" {
  type = list(string)
}

variable "aws-node-pool-instance-type" {
  type = string
}

variable "aws-control-plane-instance-type" {
  type = string
}

variable "gcp" {
  type = object({
    service-account = object({
      file = string
      name = string
    })

    ssh-private-key-file = string
  })
}