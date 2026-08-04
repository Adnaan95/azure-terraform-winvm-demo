resource "azurerm_resource_group" "rg01" {
  name     = var.rg01_name
  location = var.location
  tags = {
created_by  = "adnaan"
    created_date = "2024-06-01"
    environment = "production"
    role     = "prodvmrg"
  }

}