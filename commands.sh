#!/usr/bin/env bash

# install and activate virtual environment
make setup 

# get all dependencies
make install

# Update: Resource group now created by terraform! Uncomment if necessary.
# Create Resource Group in nearest Location necessary for running a webapp
# az group create --name udacity-azure-course-project1-iac-rg --location westeurope

# Deploy webapp 
#az webapp up -n udacity-azure-course-project2-cicd-appservice \
#      --sku F1 \
#      --resource-group udacity-azure-course-project2-cicd-rg \
#      --location westeurope


# DEPLOY MANUALLY

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
#
## Create an App Service instance in the plan
#az webapp create \
#      -g udacity-azure-course-project2-cicd-rg \
#      -p udacity-azure-course-project2-cicd-asp \
#      -n udacity-azure-course-project2-cicd-appservice \
#      --runtime "Python|3.7"


# Follow the logs of running webapp
az webapp log tail --ids /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/alindenk_rg_Linux_westeurope/providers/Microsoft.Web/sites/udacity-azure-course-project2-cicd-appservice