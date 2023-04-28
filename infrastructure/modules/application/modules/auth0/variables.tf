variable "auth0_domain" {
    type = string
}

variable "auth0_client_id" {
    type = string
}

variable "auth0_client_secret" {
    type = string
    sensitive = true
}

variable "dev_site" {
    type = string
}

variable "name_prefix" {
    type = string
}

variable "default_users_emails" {
    type = list(string)
}

variable "cloudflare_ready" {
    type = string
    default = ""
}

variable "is_test" {
    type = bool
    default = false
}
