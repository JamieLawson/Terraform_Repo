variable "resource_group_name" {
  type = string
  description = "Name of the resource group to create the resource(s) in"
}


variable "azure_region" {
  type = string
  description = "Azure region to create the resource(s) in"
  default = "UkSouth"
}


variable "workload_name" {
  type = string
  description = "Name for the Azure application workload name"
}


variable "environment_type" {
  type = string
  description = "Type of environment [Dev, Test, Prod]"

  validation {
    condition = contains(["Dev", "Test", "Prod"], var.environment_type)
    error_message = "Valid values for var: environment_type are (Dev, Test, Prod)"
  }
}


variable "operating_system" {
  type = string
  description = "Operating system to use for the app service"
  default = "Linux"

  validation {
    condition = contains(["Linux", "Windows"], var.operating_system)
    error_message = "Valid values for var: operating_sustem are (Linux, Windows)"
  }
}


variable "app_service_sku" {
  type = string
  description = "Sku for the Azure app service plan"
  default = "S1"
}



locals {
  app_service_name = concat("AS-", var.workload_name, "-", var.environment_type)
}