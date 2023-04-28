terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }

    argocd = {
      source = "oboukili/argocd"
      version = "4.3.0"
    }

    local = {
      source = "hashicorp/local"
      version = "2.2.3"
    }
  }
}
