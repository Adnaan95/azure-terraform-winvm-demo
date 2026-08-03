terraform {
  backend "azurerm" {
    resource_group_name  = "terraformstate-rg"
    storage_account_name = "tfstate39201"
    container_name       = "tfstate-container"
    key                  = "infra/primary.tfstate"
    use_azuread_auth     = true
  }
}

#Requires StorageBlobDataContributor role assigned to the storage account for this to work. The storage account is also locked down so that only my public facing IP access it.