provider "azurerm" {
  features {}
  subscription_id = "7809a880-b293-43cb-91e4-8f08b04e1c09"
}

resource "azurerm_resource_group" "rg" {
  name     = "SarfraazAPIMRG"
  location = "West Europe"
}

resource "azurerm_api_management" "apim" {
  name                = "SarfraazAPIMInstance"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "Sarfraaz"
  publisher_email     = "sarfraaz-nov-24@outlook.com"
  sku_name            = "Developer_1"
}

resource "azurerm_api_management_api" "PetstoreAPI" {
  name                = "PetstoreAPI"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Petstore API"
  path                = "PetsAPI"
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    content_value  = "https://github.com/OAI/OpenAPI-Specification/blob/main/examples/v3.0/petstore.json"
  }
}

output "api_management_url" {
  value = azurerm_api_management.apim.gateway_url
}
