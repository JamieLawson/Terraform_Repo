terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
    features {}
}


resource "azurerm_service_plan" "service_plan" {
  name = local.app_service_name
  resource_group_name = var.resource_group_name
  location = var.azure_region
  
  os_type = var.operating_system
  sku_name = var.app_service_sku
}



// Linux web app



// Windows web app



// vNet integration