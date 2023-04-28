resource "cloudflare_record" "login-domain" {
  name    = var.custom_login_domain
  type    = "CNAME"
  zone_id = var.cloudflare_zone_id
  value   = var.auth0_verification_address
  proxied = false
}
