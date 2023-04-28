resource "auth0_client" "user-login" {
  name = "${var.name_prefix}-user-login"
  app_type = "spa"
  callbacks = local.urls
  allowed_logout_urls = local.urls
  allowed_origins = local.urls
  web_origins = local.urls
  token_endpoint_auth_method = "none"
  client_metadata = {
    base_url = var.dev_site
  }
}

resource "auth0_rule" "user-on-login" {
  name   = "${var.name_prefix}-user-on-login"
  script = templatefile("${path.module}/rules/user-on-login.js", {dev_site = var.dev_site})
}

resource "auth0_connection" "user-database" {
  name     = "${var.name_prefix}-user-database"
  strategy = "auth0"
}

resource "auth0_connection_client" "user-database-connection-client" {
  connection_id = auth0_connection.user-database.id
  client_id = auth0_client.user-login.id
}

resource "auth0_connection" "google-oauth2" {
  name     = "${var.name_prefix}-google-oauth2"
  strategy = "google-oauth2"
}

resource "auth0_connection_client" "google-oauth2-connection-client" {
  connection_id = auth0_connection.google-oauth2.id
  client_id = auth0_client.user-login.id
}

resource "auth0_resource_server" "user-api" {
  identifier = var.dev_site
  name = "${var.name_prefix}-user-api"
  skip_consent_for_verifiable_first_party_clients = true
  token_lifetime = 60
  token_lifetime_for_web = 60
}

resource "auth0_custom_domain" "login-domain" {
  count  = var.is_test ? 0 : 1
  domain = "login.${var.name_prefix}.cloud.typedb.dev"
  type   = "auth0_managed_certs"
}

resource "auth0_custom_domain_verification" "login-domain-verification" {
  count  = var.is_test ? 0 : 1
  depends_on = [var.cloudflare_ready]
  custom_domain_id = auth0_custom_domain.login-domain[0].id
}

resource "auth0_branding_theme" "theme" {
  count  = var.is_test ? 0 : 1
  borders {
    widget_border_weight = local.border_thickness
    widget_corner_radius = local.border_radius
    show_widget_shadow = false
    input_border_weight = local.border_thickness
    input_border_radius = local.border_radius
    button_border_weight = local.border_thickness
    button_border_radius = local.border_radius
  }
  colors {
    base_focus_color = local.grey
    base_hover_color = local.white
    body_text = local.white
    error = local.red
    header = local.white
    icons = local.white
    input_background = local.secondary_purple
    input_border = local.light_purple
    input_filled_text = local.white
    input_labels_placeholders = local.grey
    links_focused_components = local.white
    primary_button = local.green
    primary_button_label = local.black_purple
    secondary_button_border = local.deep_purple
    secondary_button_label = local.white
    success = local.green
    widget_background = local.deep_purple
    widget_border = local.light_purple
  }
  fonts {
    font_url = "https://fonts.gstatic.com/s/titilliumweb/v15/NaPecZTIAOhVxoMyOr9n_E7fdMPmDaZRbrw.woff2"
    title {
      size = 100
      bold = true
    }
    subtitle {
      size = 87.5
    }
    links {
      size = 87.5
    }
    input_labels {
      size = 100
    }
    buttons_text {
      size = 100
    }
    body_text {
      size = 100
    }
  }
  page_background {
    background_image_url = "https://${var.name_prefix}.cloud.typedb.dev/assets/login-background.png"
  }
  widget {
    logo_url = "https://${var.name_prefix}.cloud.typedb.dev/assets/logo/s.svg"
    logo_height = 36
  }
}

resource "auth0_prompt_custom_text" "login" {
  count  = var.is_test ? 0 : 1
  prompt   = "login"
  language = "en"
  body     = jsonencode({
    "login": {
      "pageTitle": "TypeDB Cloud Login"
      "title": " "
      "description": " "
      "buttonText": "Sign In"
      "federatedConnectionButtonText": "Sign In with $${connectionName}"
      "signupActionLinkText": "Sign Up"
      "forgotPasswordText": "Forgot password"
      "emailPlaceholder": "Email"
      "logoAltText": "TypeDB Cloud"
    }
  })
}

resource "auth0_prompt_custom_text" "signup" {
  count  = var.is_test ? 0 : 1
  prompt   = "signup"
  language = "en"
  body     = jsonencode({
    "signup": {
      "pageTitle": "TypeDB Cloud Signup"
      "title": " "
      "description": " "
      "buttonText": "Sign Up"
      "emailPlaceholder": "Email"
      "federatedConnectionButtonText": "Sign In with $${connectionName}"
      "loginActionLinkText": "Log In"
      "logoAltText": "TypeDB Cloud"
    }
  })
}

resource "auth0_connection_client" "terraform-user-database-connection-client" {
  count = min(length(var.default_users_emails), 1)
  connection_id = auth0_connection.user-database.id
  client_id = var.auth0_client_id
}

resource "auth0_user" "default-users" {
  depends_on = [auth0_connection_client.terraform-user-database-connection-client]
  for_each = toset(var.default_users_emails)
  connection_name = auth0_connection.user-database.name
  email = each.value
  password = "Compliant_Password1"
}
