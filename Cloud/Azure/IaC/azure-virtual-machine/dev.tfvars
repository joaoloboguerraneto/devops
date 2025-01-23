resource_group_name = "DevResourceGroup"
location            = "East US"
admin_username      = "devadmin"
admin_password      = "DevPass123!"
address_space       = ["10.0.0.0/16"]
address_prefixes    = ["10.0.1.0/24"]
os_disk_caching     = "ReadWrite"
os_disk_storage_account_type = "Standard_LRS"
image_publisher     = "Canonical"
image_offer         = "UbuntuServer"
image_sku           = "18.04-LTS"
image_version       = "latest"
tags = {
  environment = "development"
  owner       = "dev-team"
}
