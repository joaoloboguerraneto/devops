provider "azurerm" {
  features {}
}

# Verifica se o Resource Group já existe
data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

# Cria o Resource Group somente se não existir
resource "azurerm_resource_group" "example" {
  count = length(data.azurerm_resource_group.existing.id) == 0 ? 1 : 0

  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "${var.resource_group_name}-vnet"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.address_space
}

# Subnet
resource "azurerm_subnet" "example" {
  name                 = "${var.resource_group_name}-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.address_prefixes
}

# Network Interface
resource "azurerm_network_interface" "example" {
  name                = "${var.resource_group_name}-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual Machine
resource "azurerm_linux_virtual_machine" "example" {
  name                  = "${var.resource_group_name}-vm"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  size                  = var.vm_size
  admin_username        = var.admin_username
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.example.id]
  admin_password        = var.admin_password

  # Configuração de disco via variável
  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  # Configuração de imagem via variável
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  tags = var.tags
}
