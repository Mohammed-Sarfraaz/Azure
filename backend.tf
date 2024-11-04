terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stgtfstate"
    container_name       = "contfstate"
    key                  = "apim.tfstate" 
  }
}