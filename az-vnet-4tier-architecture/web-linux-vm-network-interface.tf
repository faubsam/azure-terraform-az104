resource "azurerm_network_interface" "web-linux-vm-network-interface" {
  name = "${local.resource-name-prefix}-web-linux-vm-network-interface"
  resource_group_name = azurerm_resource_group.rg1.name
  location = azurerm_resource_group.rg1.location
  ip_configuration {
    name = "web-linux-vm-ip-1"
    subnet_id = azurerm_subnet.web-subnet.id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.web-linux-vm-public-ip.id
  }
}