variable "apprun_app_name" {
  description = "The name of the AppRun application"
  type        = string
  default     = "my_web_app"
}

variable "apprun_component_name" {
  description = "The name of the component"
  type        = string
}

variable "apprun_image_name" {
  description = "The name of the image"
  type        = string
}

variable "container_registry_name" {
  description = "The name of the container registry"
  type        = string
  default     = "my_container_registry"
}

variable "container_registry_subdomain_label" {
  description = "The subdomain label of the container registry"
  type        = string
}

variable "container_registry_user" {
  description = "The user of the container registry"
  type = object({
    name     = string
    password = string
  })
}
