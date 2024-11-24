### Inter-detector backend

![Project architecture](docs/diagram.jpg "Title")

### Installation Steps

1. [Install terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
3. Create a subscription in Azure

### Create

```sh
# Login to Azure
az login --scope https://graph.microsoft.com//.default
# Or, if you don't want to open browser:
az login --use-device-code
terraform init
# Optional, choose workspace
terraform workspace new dev
# Or, if the workspace exists
terraform workspace dev
terraform plan
terraform apply
```

### Destroy

`terraform destroy`

### CI/CD with Scraper Github

```sh
# For CI/CD
# Use this as AZURE_CLIENT_ID
terraform output app_client_id
# Use this as AZURE_CLIENT_SECRET
terraform output app_password
# Use this as AZURE_REGISTRY
# azurerm_container_registry.acr.name
```