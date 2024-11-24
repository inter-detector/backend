# locals {
#   app = var.append_workspace ? "${var.app}${title(terraform.workspace)}" : var.app
# }


# resource "azurerm_container_group" "task" {
#   name                = local.app
#   location            = var.resource_group_location
#   resource_group_name = var.resource_group_name
#   os_type             = "Linux"
  
#   # Give permissions to read from ACR
#   image_registry_credential {
#     username = azurerm_container_registry.acr.admin_username
#     password = azurerm_container_registry.acr.admin_password
#     server   = azurerm_container_registry.acr.login_server
#   }

# #   diagnostics {
# #     log_analytics {
# #      log_type      = "ContainerInsights"
# #       workspace_id  = azurerm_log_analytics_workspace.logs.workspace_id
# #       workspace_key = azurerm_log_analytics_workspace.logs.primary_shared_key
# #       metadata      = {}
# #     }
# #   }

#   ip_address_type = "None"

#   # The restart policy parameter ensures that when the container finishes,
#   # it will not restart again. In practice, this means that after the
#   # command runs, it will shut down.
#   restart_policy = "OnFailure"

#   container {
#     name                  = "runner"
#     image                 = "${var.repository_login_server}/${var.image_name}:${var.image_tag}"
#     cpu                   = "0.5"
#     memory                = "1.5"
#     environment_variables = {      
#       "AZURE_CONTAINER"   = var.azure_storage_container      
#       "AZURE_ACCOUNT_URL" = "https://${var.azure_account_url}.blob.core.windows.net/"
#       "AZURE_ACCOUNT_KEY" = var.azure_account_key
#     }
#     # Run the shellscript in the `crawler` repository that triggers
#     # code to run.
#     commands              = ["sh", "run.sh"]
#   }

# }
