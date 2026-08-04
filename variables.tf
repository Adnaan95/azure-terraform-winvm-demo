variable "location" {
  type        = string
  description = "This is the assigned location of the resource."
}

variable "rg01_name" {
  type        = string
  description = "This variable allows for a name to be assigned to a resource group."
}

variable "admin_username" {
type = string
}

variable "admin_password" {
type = string
sensitive = true
}