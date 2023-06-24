# Create the app subnet
resource "azurerm_subnet" "app-subnet" {
    name = "${azurerm_virtual_network.vnet.name}-${var.app-subnet-name}"
    resource_group_name = azurerm_resource_group.rg1.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.app-subnet-address-space
}

#Create the nsg for app subnet
resource "azurerm_network_security_group" "app-nsg" {
  name = "${azurerm_subnet.app-subnet.name}-nsg"
  resource_group_name = azurerm_resource_group.rg1.name
  location = azurerm_resource_group.rg1.location
}

#Associate the nsg with the subnet
resource "azurerm_subnet_network_security_group_association" "app-subnet-nsg-assoc" {
  depends_on = [ azurerm_network_security_rule.app-nsg-rule-inbound ]
  subnet_id = azurerm_subnet.app-subnet.id
  network_security_group_id = azurerm_network_security_group.app-nsg.id
}

#Define list of ports for the nsg rules
#Map priority to the port
#If the key in the map is a number, use a colon key : value
# If it's a string, use equal sign key = value
locals {
    app_inbound_ports = {
        "100" : "80"
        "110" : "443"
        "120" : "8080"
        "130" : "22"
    }
    
}


#Create nsg rules
resource "azurerm_network_security_rule" "app-nsg-rule-inbound" {
  for_each = local.app_inbound_ports
    name = "allow-${each.value}"
    priority = each.key
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = each.value
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = azurerm_resource_group.rg1.name
    network_security_group_name = azurerm_network_security_group.app-nsg.name

}