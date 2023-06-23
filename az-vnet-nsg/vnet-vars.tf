variable "vnet-name" {
    description = "name of the virtual network"
    value = string
    default = "default-vnet" 
}

variable "vnet-address-space" {
    description = "address space for the virtual network"
    type = list(string)
    default = [ "10.0.0.0/16" ]
}

variable "web-subnet-name" {
  description = "name of subnet for the web component"
  type = string
  default = "web-subnet"
}

variable "web-subnet-address-space" {
    description = "address space for the web subnet"
    type = list(string)
    default = [ "10.0.1.0/24" ]
}

variable "app-subnet-name" {
  description = "name of subnet for the app component"
  type = string
  default = "app-subnet"
}

variable "app-subnet-address-space" {
    description = "address space for the app subnet"
    type = list(string)
    default = [ "10.0.2.0/24" ]
}

variable "db-subnet-name" {
  description = "name of subnet for the db component"
  type = string
  default = "db-subnet"
}

variable "db-subnet-address-space" {
    description = "address space for the db subnet"
    type = list(string)
    default = [ "10.0.10.0/24" ]
}

variable "bastion-subnet-name" {
  description = "name of subnet for the bastion component"
  type = string
  default = "bastion-subnet"
}

variable "bastion-subnet-address-space" {
    description = "address space for the bastion subnet"
    type = list(string)
    default = [ "10.0.100.0/24" ]
}