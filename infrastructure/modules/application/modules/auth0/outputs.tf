output "user_ids" {
  value = values(auth0_user.default-users)[*].id
}

output "client_id" {
  description = "auth0 client id"
  value       = auth0_client.user-login.client_id
}

output "auth0_verification_address" {
  value = var.is_test ? null : auth0_custom_domain.login-domain[0].verification[0].methods[0].record
}
