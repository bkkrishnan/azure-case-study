variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
}

variable "location" {
  type        = string
  description = "The location of resource group"
}

variable "tags" {
  type        = map(string)
  description = "The Tags of resource group"
}
