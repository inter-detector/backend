# This is an illustration of a custom role

# resource "azurerm_role_definition" "acrPush" {
#   name        = "${var.prefix}-ci"
#   scope       = data.azurerm_subscription.primary.id
#   description = "Grant access to service principal to push to ACR"

#   permissions {
#     actions     = [
#         # Push to ACR
#         "Microsoft.ContainerRegistry/registries/pull/read",
#         "Microsoft.ContainerRegistry/registries/push/write"
#     ]
#     not_actions = []
#   }
# 
#   assignable_scopes = [      
#     data.azurerm_subscription.primary.id,
#   ]
# }

# This is identical to the below CLI command:
# az role assignment create --assignee $SERVICE_PRINCIPAL_ID --scope $ACR_REGISTRY_ID --role acrpull
# It is borrowed from: https://learn.microsoft.com/en-us/azure/container-registry/container-registry-auth-service-principal
# You can verify through:
# docker login ${acr.azureco.io} --username ${client_id} --password ${app_password}

# TODO: Fix this -- it fails in Azure, had to do manually via CLI
# resource "azurerm_role_assignment" "appServiceAcrPush" {
#     scope               = azurerm_container_registry.acr.id
#     # If you want to use a custom rule:
#     # role_definition_id  = azurerm_role_definition.acrPush.role_definition_resource_id    
#     role_definition_name = "AcrPush"
#     principal_id        = "${azuread_application.app.client_id}"
# }