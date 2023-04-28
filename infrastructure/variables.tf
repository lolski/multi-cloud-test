variable "project-id" {
  type = string
}

variable "resource-prefix" {
  type = string
}

variable "cluster-version" {
  type = string
}

variable "aws" {
  type = object({
    region = string
  })
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

    providers = object({
      auth0 = object({
        domain = string
        client-id = string
        client-secret = string
      })

      cloudflare = object({
        api-token = string
        zone-id = string
      })
    })

    log-retention-days = number

    platform-deployment-repo = string

    typedb-cloud-server-app = string
  })
}

variable "deployment" {
  type = object({
    aws = object({
      admins = list(string)
    })
  })
}
