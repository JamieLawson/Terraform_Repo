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


// Linux web app
resource "azurerm_linux_web_app" "web_app" {
  count = var.environment_type != "Windows" ? 1 : 0
  name = local.web_app_name
  resource_group_name = var.resource_group_name
  location = var.azure_region
  service_plan_id = var.service_plan_id

  site_config {}
}


// Windows web app
resource "azurerm_windows_web_app" "web_app" {
  count = var.environment_type != "Linux" ? 1 : 0
  name = local.web_app_name
  resource_group_name = var.resource_group_name
  location = var.azure_region
  service_plan_id = var.service_plan_id

  site_config {}
}