provider "azurerm" {
  features {}
  subscription_id = "7809a880-b293-43cb-91e4-8f08b04e1c09"
}

resource "azurerm_resource_group" "rg" {
  name     = "SarfraazAPIMRG2"
  location = "West Europe"
}

resource "azurerm_api_management" "apim" {
  name                = "SarfraazAPIMInstance2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "Sarfraaz"
  publisher_email     = "sarfraaz-nov-24@outlook.com"
  sku_name            = "Developer_1"
}

output "api_management_url" {
  value = azurerm_api_management.apim.gateway_url
}
