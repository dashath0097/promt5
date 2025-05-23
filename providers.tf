terraform {
  required_providers {
    tfe = {
      version = "~> 0.56.0"
    }
  }
}

provider "tfe" {
  hostname = var.tfc_hostname
  token    = var.tfc_token
}