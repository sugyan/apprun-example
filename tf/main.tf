terraform {
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "2.26.1"
    }
  }
}

provider "sakuracloud" {
  profile = "default"
}
