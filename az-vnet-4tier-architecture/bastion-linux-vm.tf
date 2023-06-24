# public ip address
resource "azurerm_public_ip" "bastion-linux-public-ip" {
  name = "${local.resource-name-prefix}-bastion-linux-public-ip"
  resource_group_name = azurerm_resource_group.rg1.name
  location = azurerm_resource_group.rg1.location
  sku = "Standard"
  allocation_method = "Static"
}

# network interface
resource "azurerm_network_interface" "bastion-linux-nic" {
  name = "${local.resource-name-prefix}-bastion-linux-nic"
  resource_group_name = azurerm_resource_group.rg1.name
  location = azurerm_resource_group.rg1.location
  ip_configuration {
    name = "bastion-linux-ip-1"
    subnet_id = azurerm_subnet.bastion-subnet.id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.bastion-linux-public-ip.id
  }
}

# linux virtual machine
resource "azurerm_linux_virtual_machine" "bastion-linux-vm" {
  name = "${local.resource-name-prefix}-bastion-linux-vm"
  resource_group_name = azurerm_resource_group.rg1.name
  location = azurerm_resource_group.rg1.location
  computer_name = "bastion-linux-vm"
  size = "Standard_DS1"
  admin_username = "azureadmin"
  network_interface_ids = [ azurerm_network_interface.bastion-linux-nic.id  ]
  
  /*
  admin_ssh_key {
   username = "azureadmin"
   public_key = file("${path.module}/ssh-keys/terraform-azure.pub")  
  }
  */
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
}