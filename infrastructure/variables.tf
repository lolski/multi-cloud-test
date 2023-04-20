variable "project-id" {
  type = string
}
variable "aws-region" {}
variable "gcp" {
  type = object({
    service-account = object({
      file = string
      name = string
    })

    ssh-private-key-file = string
  })
}

variable "resource-prefix" {
  type = string
}

variable "cluster-version" {
  type = string
}

variable "application" {
  type = object({
    placement = object({
      region = string
      AZs = list(string)
    })

    instances = object({
      count = object({
        min = number
        max = number
      })
      type = string
    })
  })
}

variable "deployment" {
  type = object({
    aws = object({
      admins = list(string)
    })
  })
}