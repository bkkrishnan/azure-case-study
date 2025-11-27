output "vnet" {
  value = {
    id   = azurerm_network_security_group.main.id
    name = azurerm_network_security_group.main.name
  }
}
