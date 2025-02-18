resource "sakuracloud_container_registry" "container_registry" {
  name            = var.container_registry_name
  subdomain_label = var.container_registry_subdomain_label
  access_level    = "none"

  user {
    name       = var.container_registry_user.name
    password   = var.container_registry_user.password
    permission = "readwrite"
  }
}
