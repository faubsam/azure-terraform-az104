locals {
  webvm-custom-data = <<CUSTOM_DATA
sudo dnf install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html
echo "Red Hat Enterprise Linux VM ---- hostname: $(hostname)"
sudo mkdir /var/www/html/app1
  CUSTOM_DATA
}

resource "azurerm_linux_virtual_machine" "web-linux-vm" {
  name = "${local.resource-name-prefix}-web-linux-vm"
  resource_group_name = azurerm_resource_group.rg1.name
  location = azurerm_resource_group.rg1.location
  computer_name = "web-linux-vm"
  size = "Standard_DS1"
  admin_username = "azureadmin"
  network_interface_ids = [ azurerm_network_interface.web-linux-vm-network-interface.id  ]
  admin_ssh_key {
   username = "azureadmin"
   public_key = file("${path.module}/ssh-keys/terraform-azure.pub")  
  }
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/rhel-webvm.sh")
}