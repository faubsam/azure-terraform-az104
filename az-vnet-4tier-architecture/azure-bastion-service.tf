resource "azurerm_subnet" "az-bastion-subnet" {
  name = var.az-bastion-service-subnet-name
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.az-bastion-service-address-space
}

resource "azurerm_public_ip" "az-bastion-service-public-ip" {
  name = "${local.resource-name-prefix}-az-bastion-service-public-ip"
    resource_group_name = azurerm_resource_group.rg1.name
    location = azurerm_resource_group.rg1.location
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_bastion_host" "az-bastion-host" {
  name = "${local.resource-name-prefix}-az-bastion-host"
  resource_group_name = azurerm_resource_group.rg1.name 
  location = azurerm_resource_group.rg1.location
  ip_configuration {
    name = "az-bastion-ip-config"
    subnet_id = azurerm_subnet.bastion-subnet.id
    public_ip_address_id = azurerm_public_ip.az-bastion-service-public-ip.id
  }
}