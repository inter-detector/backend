resource "azurerm_container_registry" "acr" {  
  # Add as AZURE_REGISTRY (repository secret) for CI/CD
  # Identical to below CLI command:
  # az acr show --name $ACR_NAME --query "id"
  name                = "${var.prefix}ContainerRegistry"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  sku                 = "Standard"
  admin_enabled       = true  
}
