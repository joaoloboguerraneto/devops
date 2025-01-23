# Output do endereço IP privado da VM
output "vm_private_ip" {
  description = "The private IP of the Virtual Machine"
  value       = azurerm_network_interface.example.private_ip_address
}

# Nome do Resource Group
output "resource_group_name" {
  description = "The name of the Resource Group"
  value       = azurerm_resource_group.example.name
}

# Nome da VM
output "vm_name" {
  description = "The name of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.example.name
}
