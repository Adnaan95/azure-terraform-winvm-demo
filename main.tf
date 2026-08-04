module "resource_group" {
  source = "./modules/resourcegroups"
  location = var.location
  rg01_name = var.rg01_name
}

module "security" {
  source = "./modules/security"
  location = var.location
  rg01_name = var.rg01_name
}   

module "windows_vm" {
  source = "./modules/windows-vm"
  location = var.location
  rg01_name = var.rg01_name
}   

module "network" {
  source = "./modules/network"
  location = var.location
  rg01_name = var.rg01_name
}