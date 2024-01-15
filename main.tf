# A Service Principal is an application within Azure Active Directory
# whose authentication tokens can be used as the client_id, client_secret, and tenant_id
# fields needed by Terraform.

resource "azuread_application" "app" {
    display_name  =  "${var.prefix}App"
}


resource "azuread_service_principal" "app" {
    client_id  =  azuread_application.app.client_id
}

 
resource "azuread_application_password" "example" {
    application_object_id  =  azuread_application.app.object_id
}

   
# Output the Service Principal client id and password
# You can run e.g. `terraform output app_id` to view app id

# Identical to below CLI command:
# az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].appId" --output tsv
output "app_client_id" {
    value  =  azuread_application.app.client_id
    sensitive  =  true
}


output "app_password" {
    value  =  azuread_application_password.example.value
    sensitive  =  true
}
