resource "azurerm_public_ip" "prod-winvm-01-pip" {
  name                = "prod-winvm-01-pip"
  location            = var.location
  resource_group_name = var.rg01_name

  allocation_method = "Static"
}

resource "azurerm_network_interface" "prod-winvm-01-nic" {
  name                = "prod-winvm-01-nic"
  location            = var.location
  resource_group_name = var.rg01_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.prod-winvm-01-pip.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "prod-winvm-01" {
  name                = "prod-winvm-01"
  location            = var.location
  resource_group_name = var.rg01_name

  size = "Standard_FX2ms_v2"

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.prod-winvm-01-nic.id
  ]

  lifecycle {
ignore_changes = [
admin_username,
admin_password
]
}

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

source_image_id = var.source_image_id

secure_boot_enabled = true
vtpm_enabled = true

}


