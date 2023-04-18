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

variable "application-cluster-project-id" {
  type = string
}

variable "application-cluster-region" {
  type = string
}

variable "application-cluster-az" {
  type = string
}

variable "application-cluster-min-nodes" {
  type = number
}

variable "application-cluster-max-nodes" {
  type = number
}

variable "application-cluster-instance-type" {
  type = string
}

variable "application-cluster-svc-acc-name" {
  type = string
}

variable "application-cluster-credentials" {
  type = string
}

variable "application-cluster-ssh-private-key" {
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

variable "deployment" {
  type = object({
    gcp = object({
      project-id = string

      service-account = object({
        file = string
        name = string
      })

      ssh-private-key-file = string
      //
    })
  })
}