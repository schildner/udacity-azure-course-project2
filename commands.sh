#!/usr/bin/env bash

# install and activate virtual environment
make setup 

# get all dependencies
make install

# Update: Resource group now created by terraform! Uncomment if necessary.

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
#az webapp log tail --name udacity-azure-course-project2-cicd-appservice --resource-group udacity-azure-course-project2-cicd-rg