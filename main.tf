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
}   

module "networking" {
  source = "./modules/networking"
  location = var.location
  rg01_name = var.rg01_name
}