resource "azurerm_resource_group" "rg" {
  name     = "mss-rg-apim"
  location = "eastus"
}

resource "azurerm_api_management" "apim" {
  name                = "mssapim2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "Sarfraaz"
  publisher_email     = "sarfraaz-nov-24@outlook.com"
  sku_name            = "Developer_1"
}
