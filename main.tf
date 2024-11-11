terraform {
  backend "azurerm" {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name 
  location = var.location 
}


resource "azurerm_api_management" "apim" {
  name                = var.apim_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  publisher_name  = var.publisher_name
  publisher_email = var.publisher_email
  sku_name        = "${var.sku_tier}_${var.sku_capacity}"
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
