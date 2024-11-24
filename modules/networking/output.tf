output "output" {
  value = {
    vnet                = azurerm_virtual_network.vnet.id
    ip_address          = azurerm_public_ip.pip.ip_address
  }
}