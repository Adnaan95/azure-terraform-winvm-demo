resource "azurerm_network_security_group" "prod-nsg-winvm" {
  name                = "prod-nsg-winvm"
  location            = var.location
  resource_group_name = var.rg01_name

  tags = {
    Environment = "dev"
  }
}

resource "azurerm_network_security_rule" "allow_rdp" {
  name                        = "Allow-RDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "3389"

  source_address_prefix       = "90.205.188.30"
  destination_address_prefix  = "*"

  resource_group_name         = var.rg01_name
  network_security_group_name = azurerm_network_security_group.prod-nsg-winvm.name
}

resource "azurerm_subnet_network_security_group_association" "prod-subnet-nsg-association" {
  subnet_id = var.subnet_id
  network_security_group_id = azurerm_network_security_group.prod-nsg-winvm.id
}