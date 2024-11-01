terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stgtfstate"
    container_name       = "contfstate"
    key                  = "apim.tfstate"
    use_oidc             = true
    tenant_id            = env.ARM_TENANT_ID
    subscription_id      = env.ARM_SUBSCRIPTION_ID
    client_id            = env.ARM_CLIENT_ID
  }
}