variable "cloudflare_zone_id" {
  type = string
  description = "The zone ID to manage objects in"
}

variable "api_token" {
  type = string
  description = "A Cloudflare API Token to authenticate the management of objects"
}

variable "custom_login_domain" {
  type = string
  description = "The custom Auth0 login domain"
}

variable "auth0_verification_address" {
  type = string
  description = "Address for verifying the Auth0 custom domain"
}
