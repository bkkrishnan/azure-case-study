variable "subnet_name" {
  type        = string
  description = "Name of Subnet"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name of subnet"
}

variable "vnet_name" {
  type        = string
  description = "The Virutal Network name of subnet"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "The address prefix of subnet"
}

