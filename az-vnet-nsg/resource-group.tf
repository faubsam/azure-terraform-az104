resource "azurerm_resource_group" "rg1" {
  name = "${local.resource_name_prefix}-${var.resource-group-name}-${random_string.random-string.id}"
  location = var.resource-group-location
  tags = local.basic_tags
}