module "resource_group" {
    source = "./modules/resource-group"

    region                   = "West US"
    app                      = "crawlerResourceGroup"
}

module "acr" {
    source = "./modules/acr"

    app                     = "crawlerAcr"
    resource_group_name     = module.resource_group.output.resource_group_name
    resource_group_location = module.resource_group.output.resource_group_location
}

# A Service Principal is an application within Azure Active Directory
# whose authentication tokens can be used as the client_id, client_secret,
# and tenant_id fields needed by Terraform.

resource "azuread_application" "app" {
    display_name = "app"
}

resource "azuread_service_principal" "app" {
    client_id = azuread_application.app.client_id
}
 
resource "azuread_application_password" "key" {
    application_id  =  azuread_application.app.id
}

# For our CI/CD pipeline, the service principal needs access to ACR.
# Ideally this would be in a separate repository.

# This is identical to the below CLI command:
# az role assignment create --assignee $SERVICE_PRINCIPAL_ID --scope $ACR_REGISTRY_ID --role acrpull
# It is borrowed from: https://learn.microsoft.com/en-us/azure/container-registry/container-registry-auth-service-principal
# You can verify through:
# docker login ${acr.azureco.io} --username ${client_id} --password ${app_password}

resource "azurerm_role_assignment" "appServiceAcrPush" {
    scope                = data.azurerm_subscription.primary.id
    role_definition_name = "AcrPush"
    principal_id         = azuread_service_principal.app.object_id
}