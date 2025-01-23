# Localização padrão para os recursos
variable "location" {
  description = "Location where the resources will be created"
  type        = string
}

# Nome do Resource Group
variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

# Tags aplicadas aos recursos
variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}
