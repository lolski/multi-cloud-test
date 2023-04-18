variable "project-id" {
  type = string
}

variable "resource-prefix" {
  type = string
}

variable "cluster-version" {
  type = string
}

variable "placement" {
  type = object({
    region = string
    AZs = list(string)
  })
}

variable "instances" {
  type = object({
    count = object({
      min = number
      max = number
    })
    type = string
  })
}

variable "service-account" {
  type = object({
    file = string
    name = string
  })
}