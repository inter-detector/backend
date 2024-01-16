# A Service Principal is an application within Azure Active Directory
# whose authentication tokens can be used as the client_id, client_secret, and tenant_id
# fields needed by Terraform.

resource "azuread_application" "app" {
    display_name  =  "${var.prefix}App"
}


resource "azuread_service_principal" "app" {
    client_id  =  azuread_application.app.client_id
}

 
resource "azuread_application_password" "key" {
    application_object_id  =  azuread_application.app.object_id
}
