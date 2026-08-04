resource "azurerm_virtual_network" "prod-vnet-winvm" {
  name                = "prod-vnet-winvm"
  location            = var.location
  resource_group_name = var.rg01_name

  address_space = ["10.0.0.0/16"]

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_subnet" "prod-subnet-winvm" {
  name                 = "prod-subnet-winvm"
  resource_group_name  = var.rg01_name
  virtual_network_name = azurerm_virtual_network.prod-vnet-winvm.name

  address_prefixes = ["10.0.1.0/24"]
}