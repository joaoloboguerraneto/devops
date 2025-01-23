# Resource Group Name
variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

# Location
variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

# VM Size
variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

# Admin Username
variable "admin_username" {
  description = "The Admin Username for the VM"
  type        = string
  default     = "azureuser"
}

# Admin Password
variable "admin_password" {
  description = "The Admin Password for the VM"
  type        = string
  sensitive   = true
}

# Address Space for Virtual Network
variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Address Prefixes for Subnet
variable "address_prefixes" {
  description = "Address prefixes for the Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# OS Disk Configuration
variable "os_disk_caching" {
  description = "Caching for the OS Disk"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "Storage account type for the OS Disk"
  type        = string
  default     = "Standard_LRS"
}

# Image Reference Configuration
variable "image_publisher" {
  description = "Publisher of the source image"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Offer of the source image"
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "SKU of the source image"
  type        = string
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "Version of the source image"
  type        = string
  default     = "latest"
}

# Tags
variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {
    environment = "development"
    owner       = "Joao Lobo"
  }
}
