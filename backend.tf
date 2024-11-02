terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stgtfstate"
    container_name       = "contfstate"
    key                  = "apim.tfstate"
    use_oidc             = true
    tenant_id            = var.tenant_id
    subscription_id      = var.subscription_id
    client_id            = var.client_id
  }
}