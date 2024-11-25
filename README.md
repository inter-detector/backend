### Inter-detector backend

"Inter-detector" is a project that involves using publically available data to build a machine learning model which predicts how a player in a game called League of Legends performed in their last game. The intended result is a SHAP explainer of a logistic regression that will tell a user what features most impacted the outcome of their last game; for instance, the amount of kills, deaths, assists, or time-based features, like CS difference at 10 minutes. The project has 4 teams: data gathering, data processing, data science (the ML model), then a front-end application. This repository includes the Terraform infrastructure in Azure for everything.

Explained in detail:
1. Data gathering: a serverless architecture to run a Docker container which gathers publically available data. The script to gather data is in a separate repository. This is an Azure container instance which pushes data to Azure storage.
2. Data processing: a database built on top of hierarchical file structure located in Azure. This will likely be an Azure data lake.
3. Data science: a logistic regssion model trained on match data, visualized with SHAP plots.
4. Front-end application: still in progress, not sure what this will look like.

Currently, the project is still at stage one 😪

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
