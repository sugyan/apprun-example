resource "sakuracloud_apprun_application" "app" {
  depends_on = [sakuracloud_container_registry.container_registry]

  name            = var.apprun_app_name
  timeout_seconds = 30
  port            = 3000
  min_scale       = 0
  max_scale       = 1

  components {
    name       = var.apprun_component_name
    max_cpu    = 1
    max_memory = "512Mi"
    deploy_source {
      container_registry {
        image    = "${sakuracloud_container_registry.container_registry.fqdn}/${var.apprun_image_name}"
        server   = sakuracloud_container_registry.container_registry.fqdn
        username = var.container_registry_user.name
        password = var.container_registry_user.password
      }
    }
  }

  traffics {
    version_index = 0
    percent       = 100
  }
}
