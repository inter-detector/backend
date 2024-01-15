resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-resource-group"
  location = "West US"
}