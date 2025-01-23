# Output do nome do Resource Group
output "resource_group_name" {
  description = "The name of the created Resource Group"
  value       = azurerm_resource_group.example.name
}

# Output da localização do Resource Group
output "resource_group_location" {
  description = "The location of the created Resource Group"
  value       = azurerm_resource_group.example.location
}

# Output do ID do Resource Group
output "resource_group_id" {
  description = "The ID of the created Resource Group"
  value       = azurerm_resource_group.example.id
}
