output "web-linux-vm-id" {
  value = azurerm_linux_virtual_machine.web-linux-vm.id
}

output "web-linux-vm-public-ip" {
  value = azurerm_public_ip.web-linux-vm-public-ip.ip_address
}