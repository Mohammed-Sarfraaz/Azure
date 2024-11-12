terraform {
  backend "azurerm" {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name #"mss-rg-apim"
  location = var.apim_location       #"eastus"
}


resource "azurerm_api_management" "apim" {
  name                = var.apim_name #"mssapim2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = var.publisher_name  #"Sarfraaz"
  publisher_email     = var.publisher_email #"sarfraaz-nov-24@outlook.com"
  sku_name            = "Developer_1"
}

# create API
resource "azurerm_api_management_api" "api" {
  name                = "health-probe"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Health probe"
  path                = "health-probe"
  protocols           = ["https"]

  import {
    content_format = "openapi"
    content_value  = file("${path.module}/apis/ping-api.yaml")
  }
}