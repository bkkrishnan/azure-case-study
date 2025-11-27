variable "nsg_name" {
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

variable "nsg_security_rules" {
  type        = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })  )
  description = "The Tags of Virtual Network"
}

variable "tags" {
  type        = map(string)
  description = "The Tags of Virtual Network"
}

