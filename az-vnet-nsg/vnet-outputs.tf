output "virtual-network-name" {
  value = azurerm_virtual_network.vnet.name
}

output "virtual-network-id" {
  value = azurerm_virtual_network.vnet.id 
}

output "web-subnet-name" {
  value = azurerm_subnet.web-subnet.name
}

output "web-subnet-id" {
  value = azurerm_subnet.web-subnet.id
}

output "web-subnet-nsg-name" {
    value = azurerm_network_security_group.web-nsg.name
}

output "web-subnet-nsg-id" {
  value = azurerm_network_security_group.web-nsg.id
}