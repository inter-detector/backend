variable "append_workspace" {
  description = "Appends the terraform workspace at the end of resource names, <identifier>-<workspace>"
  default     = true
  type        = bool
}

variable "app" {
  description = "(Required) Name of the Azure Container task"
  type        = string
}

variable "resource_group_name" {
  description = "(Required) Name of the Azure resource group"
  type        = string
}

variable "resource_group_location" {
  description = "(Required) Location of the Azure resource group"
  type        = string
}

variable "repository_login_server" {
  description = "(Required) The login server of the Azure repository"
  type        = string
}

variable "image_name" {
  description = "(Required) The image name in the container repository"
  type        = string
}

variable "image_tag" {
  description = "(Required) The image tag in the container repository"
  type        = string
}

variable "azure_storage_container" {
  description = "(Required) The Azure storage container to push data to"
  type        = string
}

variable "azure_account_url" {
  description = "(Required) The Azure storage account name"
  type        = string
}

variable "azure_account_key" {
  description = "(Required) The Azure storage account primary access key"
  type        = string
}