terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.35.0"
    }
  }

  required_version = ">= 1.3.0, < 1.4.0"
}
