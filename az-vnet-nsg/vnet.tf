resource "azurerm_virtual_network" "vnet" {
  name = "${local.resource_name_prefix}-${var.vnet-name}"
  address_space = var.vnet-address-space
  location = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  tags = local.basic_tags
}