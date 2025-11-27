variable "vnet_name" {
  type        = string
  description = "Name of Virtual Network"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name of Virtual Network"
}

variable "location" {
  type        = string
  description = "The location of Virtual Network"
}

variable "vent_address_space" {
  type        = list(string)
  description = "The Tags of Virtual Network"
}

variable "tags" {
  type        = map(string)
  description = "The Tags of Virtual Network"
}

