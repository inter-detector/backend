resource "azurerm_storage_account" "storageacc" {
  name                     = "${var.prefix}storageacc"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storagecontainer" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.storageacc.name
  container_access_type = "private"
}
