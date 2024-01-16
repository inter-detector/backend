resource "azurerm_container_group" "task" {
  name                = "${var.prefix}-run-task"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  image_registry_credential {
    username = azurerm_container_registry.acr.admin_username
    password = azurerm_container_registry.acr.admin_password
    server   = azurerm_container_registry.acr.login_server
  }

  diagnostics {
    log_analytics {
     log_type      = "ContainerInsights"
      workspace_id  = azurerm_log_analytics_workspace.logs.workspace_id
      workspace_key = azurerm_log_analytics_workspace.logs.primary_shared_key
      metadata      = {}
    }
  }

  ip_address_type = "None"

  # The restart policy parameter ensures that when the container finishes,
  # it will not restart again. In practice, this means that after the
  # command runs, it will shut down.
  restart_policy = "OnFailure"

  container {
    name                  = "runner"
    image                 = "${azurerm_container_registry.acr.login_server}/crawler:latest"
    cpu                   = "0.5"
    memory                = "1.5"
    environment_variables = {      
      "AZURE_CONTAINER"   = azurerm_storage_container.storagecontainer.name      
      "AZURE_ACCOUNT_URL" = "https://${azurerm_storage_account.storageacc.name}.blob.core.windows.net/"
      "AZURE_ACCOUNT_KEY" = azurerm_storage_account.storageacc.primary_access_key
    }
    commands              = ["sh", "run.sh"]
  }

}
