variable "resource-prefix" {
  type = string
}

variable "cluster-version" {
  type = string
}

variable "fleet" {
  type = object({
    project-id = string
    region = string
  })
}

variable "aws" {
  type = object({
    resource-group = string
    admins = list(string)
  })
}

variable "gcp" {
  type = object({
    project-id = string
    service-account = object({
      file = string
      name = string
    })

    ssh-private-key-file = string
  })
}