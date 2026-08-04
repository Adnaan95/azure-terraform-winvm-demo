module "resource_group" {
  source = "./modules/resourcegroups"
  location = var.location
  rg01_name = var.rg01_name
}

module "security" {
  source = "./modules/security"
  location = var.location
  rg01_name = var.rg01_name
  subnet_id = module.networking.subnet_id
}   

module "windows_vm" {
  source = "./modules/windows-vm"
  location = var.location
  rg01_name = var.rg01_name
  subnet_id = module.networking.subnet_id
    admin_username = var.admin_username
    admin_password = var.admin_password
    source_image_id = data.azurerm_shared_image_version.win10_avd.id
}   

module "networking" {
  source = "./modules/networking"
  location = var.location
  rg01_name = var.rg01_name
}

data "azurerm_shared_image_version" "win10_avd" {
  name                = "0.0.1"
  image_name          = "imgdef-avd-w10ms-prod-ukw"
  gallery_name        = "acgavdprodukw"
  resource_group_name = "rg-avd-prod-ukw"
}
