terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}
