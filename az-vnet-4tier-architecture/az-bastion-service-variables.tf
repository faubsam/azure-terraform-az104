variable "az-bastion-service-subnet-name" {
  default = "az-bastion-subnet"
}

variable "az-bastion-service-address-space" {
  default = [ "10.0.101.0/27" ]
}