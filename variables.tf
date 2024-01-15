# Used to reference Azure subscription 
# data.azurerm_subscription.primary.id
data "azurerm_subscription" "primary" {}

variable "prefix" {
    description = "Name to prefix all Azure resources with"
    type        = string
}
