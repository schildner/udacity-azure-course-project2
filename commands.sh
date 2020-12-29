#!/usr/bin/env bash

# Update: Resources may be created by terraform or manually. (Un)comment whichever you prefer.

# CREATE RESOURCES MANUALLY

# Create resource group

#az group create \
#      -l westeurope \
#      -n udacity-azure-course-project2-cicd-rg

# Create app service plan

#az appservice plan create \
#      -g udacity-azure-course-project2-cicd-rg \
#      -n udacity-azure-course-project2-cicd-asp \
#      --is-linux \
#      --sku B1


# CREATE RESOURCES USING TERRAFORM
terraform init
terraform plan -out solution.plan
terraform apply "solution.plan"

# DEPLOY APP
az webapp up \
      -n udacity-azure-course-project2-cicd-appservice \
      -l westeurope \
      --sku B1 \

# Follow the logs of running webapp
#az webapp log tail --name udacity-azure-course-project2-cicd-appservice --resource-group udacity-azure-course-project2-cicd-rg