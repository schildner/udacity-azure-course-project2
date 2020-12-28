#!/usr/bin/env bash

# install virtual environment
make setup 

# activate venv
source ~/.udacity-azure-course-project2/bin/activate

# Update: Resource group now created by terraform! Uncomment if necessary.
# Create Resource Group in nearest Location necessary for running a webapp
# az group create --name udacity-azure-course-project1-iac-rg --location westeurope

# Deploy webapp 
az webapp up -n udacity-azure-course-project2-cicd-appservice \
      --sku F1 \
      --resource-group udacity-azure-course-project2-cicd-rg \
      -l westeurope