resource_group_name = "ProdResourceGroup"
location            = "West Europe"
admin_username      = "prodadmin"
admin_password      = "ProdPass123!"
address_space       = ["10.1.0.0/16"]
address_prefixes    = ["10.1.1.0/24"]
os_disk_caching     = "ReadOnly"
os_disk_storage_account_type = "Premium_LRS"
image_publisher     = "Canonical"
image_offer         = "UbuntuServer"
image_sku           = "20.04-LTS"
image_version       = "latest"
tags = {
  environment = "production"
  owner       = "prod-team"
}
