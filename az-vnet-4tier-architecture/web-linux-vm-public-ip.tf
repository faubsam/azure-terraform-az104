resource "azurerm_public_ip" "web-linux-vm-public-ip" {
  name = "${local.resource-name-prefix}-web-linux-vm-public-ip"
  resource_group_name = azurerm_resource_group.rg1.name
  location = azurerm_resource_group.rg1.location
  allocation_method = "Static"
  sku = "Standard"
  domain_name_label = "app1-vm-${random_string.random-string.id}"
}