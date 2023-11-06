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


resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  count = var.subnet_id != "" ? 1 : 0
  app_service_id = azurerm_app_service.service_plan.id
  subnet_id      = var.subnet_id
}