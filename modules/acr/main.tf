locals {
  app = var.append_workspace ? "${var.app}${title(terraform.workspace)}" : var.app
}


resource "azurerm_container_registry" "acr" {
  # Add as AZURE_REGISTRY (repository secret) for CI/CD
  # Identical to below CLI command:
  # az acr show --name $ACR_NAME --query "id"
  name                = local.app
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  # The SKU name of the container registry. Possible values
  # are: Basic, Standard and Premium.
  # Here we choose basic to cut costs :)
  sku                 = "Basic"
  # The admin account is needed when you use the Azure portal
  # to deploy a container image from a registry directly.
  # If you need to debug the container in console, this can
  # be flipped to True. Otherwise, you will get something that
  # says "Admin user must first be enabled for this registry
  # in order to access the image during the container instance creation"
  # on the "Registry" drop down when trying to create a container
  # instance. Read more about this here:
  # https://learn.microsoft.com/en-us/azure/container-registry/container-registry-authentication?tabs=azure-cli#admin-account
  admin_enabled       = false
}