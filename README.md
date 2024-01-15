### Inter-detector backend

### Installation Steps

1. [Install terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

### Create

```
terraform init
terraform plan
terraform apply
```

### Destroy

`terraform destroy`

### Configuration

- CI/CD to mirror Docker container to ACR: use `terraform output app_client_id` as `$AZURE_CLIENT_ID`, `terraform output app_password` as `$AZURE_CLIENT_SECRET`, and `${azurerm_container_registry.acr.name}` as `$AZURE_REGISTRY` as repository secrets