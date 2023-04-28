terraform {
  required_version = ">=0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.53"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-log-export:storage/v6.0.1"
  }
}