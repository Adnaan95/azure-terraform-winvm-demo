output "subnet_id" {
  description = "The ID of the subnet"
value = azurerm_subnet.prod-subnet-winvm.id
}