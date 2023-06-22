resource "azurerm_virtual_network" "vnet-1" {
    name = "vnet-1"
    address_space = [ "10.0.0.0/16" ]
    location = azurerm_resource_group.az-tf-devops-rg.location
    resource_group_name = azurerm_resource_group.az-tf-devops-rg.name
    tags = {
        "environment" = "dev"
    } 
}

resource "azurerm_subnet" "subnet-1" {
    name = "subnet-1"
    resource_group_name = azurerm_resource_group.az-tf-devops-rg.name
    virtual_network_name = azurerm_virtual_network.vnet-1.name
    address_prefixes = [ "10.0.1.0/24" ]
}

resource "azurerm_public_ip" "publicip-1" {
    name = "publicip-1"
    resource_group_name = azurerm_resource_group.az-tf-devops-rg.name
    location = azurerm_resource_group.az-tf-devops-rg.location
    allocation_method = "Static"
    tags = {
        "environment" = "dev"
    }
}

resource "azurerm_network_interface" "network-interface-1" {
    name = "nic-1"
    location = azurerm_resource_group.az-tf-devops-rg.location
    resource_group_name = azurerm_resource_group.az-tf-devops-rg.name
    ip_configuration {
      name = "internal-net"
      subnet_id = azurerm_subnet.subnet-1.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.publicip-1.id
    }
}