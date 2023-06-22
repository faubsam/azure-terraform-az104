terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    skip_provider_registration = "true"
    features {}
    subscription_id = "ffb9decf-2f06-478e-9f0e-b05f38112b43"
    tenant_id = "c745f5ee-de6d-4971-9f66-c6b7423b3449"
}