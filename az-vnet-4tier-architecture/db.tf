# Create the db subnet
resource "azurerm_subnet" "db-subnet" {
    name = "${azurerm_virtual_network.vnet.name}-${var.db-subnet-name}"
    resource_group_name = azurerm_resource_group.rg1.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.db-subnet-address-space
}

#Create the nsg for db subnet
resource "azurerm_network_security_group" "db-nsg" {
  name = "${azurerm_subnet.db-subnet.name}-nsg"
  resource_group_name = azurerm_resource_group.rg1.name
  location = azurerm_resource_group.rg1.location
}

#Associate the nsg with the subnet
resource "azurerm_subnet_network_security_group_association" "db-subnet-nsg-assoc" {
  depends_on = [ azurerm_network_security_rule.db-nsg-rule-inbound ]
  subnet_id = azurerm_subnet.db-subnet.id
  network_security_group_id = azurerm_network_security_group.db-nsg.id
}

#Define list of ports for the nsg rules
#Map priority to the port
#If the key in the map is a number, use a colon key : value
# If it's a string, use equal sign key = value
locals {
    db_inbound_ports = {
        "100" : "3306" # MySQL
        "110" : "1433" # MSSQL
        "120" : "5432" # PostgreSQL
    }
    
}


#Create nsg rules
resource "azurerm_network_security_rule" "db-nsg-rule-inbound" {
  for_each = local.db_inbound_ports
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
    network_security_group_name = azurerm_network_security_group.db-nsg.name

}