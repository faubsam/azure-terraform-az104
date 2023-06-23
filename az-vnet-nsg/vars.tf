variable "business-division" {
    description = "The business division who owns the resource"
    type = string
    default = "sap"
}

variable "environment" {
    description = "Env variable to be used as prefix"
    default = "dev"
}

variable "resource-group-name" {
    description = "the resource group where the resources will be located"
    default = "az-tf-devops-rg"
}

variable "resource-group-location" {
  description = "The default Azure region for resources"
  default = "eastasia"
}

