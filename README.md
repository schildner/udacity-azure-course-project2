# Overview

![Python application test with Github Actions](https://github.com/schildner/udacity-azure-course-project2/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)

This project contains a python flask app which serves out housing prices predictions through API calls.

The algorithm is based on pre-trained sklearn ML model for Boston area.

This repository was created for the Udacity Azure DevOps Course Project 2 submission to demonstrate CI/CD techiques knowledge acquired in the course. Pushes to this GitHub repository's main branch trigger a CI build on GitHub Actions. Continuous Delivery pipeline, also triggered automatically by pushes to this repository is performed via Azure Pipelines.

## Project Plan

* A link to a Trello board for the project: [Udacity Azure Course Project 2](https://trello.com/b/2bKbpU9v/udacity-azure-course-project-2)
* A link to a spreadsheet that includes the original and final project plan: [Spreadsheet on Google Drive](https://docs.google.com/spreadsheets/d/1VvhKAVZM7I1qVYufkkjYf5vR3nBcCQtji21aupZyXik/edit?usp=sharing)
  * (Contains 5 sheets: Yearly Project Management Plan, Q1, Q2, Q3, Q4)

## Instructions
  
### Architectural Diagram

<TODO (Shows how key parts of the system work)>

### Dependencies

1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Terraform](https://www.terraform.io/downloads.html)

### Getting Started

1. Open Azure cloud shell
2. Create gpg keys for ssh access to GitHub repo. This creates files with private and public keys in directory ~/.ssh/
```bash
user@Azure:~/ ssh-keygen -t rsa
```
3. Copy contents of the new public key file: id_rsa.pub
```bash
user@Azure:~/ cat ~/.ssh/id_rsa.pub
```
4. Add new key to your GitHub profile (Settings, GPG keys, add new), paste the key and add some name - could be anything.
5. Clone this repository into your azure cloud shell:
```bash
user@Azure:~/ git clone git@github.com:schildner/udacity-azure-course-project2.git
```
6. Enter the dir with the project:
```bash
user@Azure:~/ cd udacity-azure-course-project2
```
7. Install & activate virtual environment, install dependencies:
```bash
user@Azure:udacity-azure-course-project2/ make setup && make install
```

8. Make sure the following environment variables are set and correspond to your azure account details:

* ARM_CLIENT_ID
* ARM_CLIENT_SECRET
* ARM_SUBSCRIPTION_ID
* ARM_TENANT_ID

Login to your azure account and see the account details:

```bash
user@Azure:~/ az login
user@Azure:~/ az account list
```

Use export command to assign the values from corresponding subscription to the following env vars:
Actually, ARM_SUBSCRIPTION_ID was enough :)

```bash
user@Azure:~/ export ARM_CLIENT_ID=<value from property 'homeTenantId'>
user@Azure:~/ export ARM_CLIENT_SECRET=<value from>
user@Azure:~/ export ARM_SUBSCRIPTION_ID=<value from property 'id'>
user@Azure:~/ export ARM_TENANT_ID=<value from property 'tenantId'>
```

### Instructions for running the Python project

0. In Azure cloud shell

1. Go into the cloned project's directory and perform the following Terraform commands:

```bash
user@Azure:~/$ cd udacity-azure-course-project2
user@Azure:~/udacity-azure-course-project2$ terraform init
user@Azure:~/udacity-azure-course-project2$ terraform plan -out solution.plan
user@Azure:~/udacity-azure-course-project2$ terraform apply "solution.plan"
```

This should have created the resource group, app service plan, app service and storage account:
udacity-azure-course-project2-cicd-rg
udacity-azure-course-project2-cicd-asp
udacity-azure-course-project2-cicd-appservice
udacity-azure-course-project2-cicd-cloudshell-sa

2. Run the script commands.sh to deploy the python project to Azure

* Project running on Azure App Service

Create a webapp and deploy code from a local workspace to the app. The command is required to run from the folder where the code is present.

```bash
(.udacity-azure-course-project2) user@Azure:~/udacity-azure-course-project2$ ./commands.sh

The webapp 'udacity-azure-course-project2-cicd' doesn't exist
Creating webapp 'udacity-azure-course-project2-cicd' ...
Configuring default logging for the app, if not already enabled
Creating zip with contents of dir /home/anja/udacity-azure-course-project2 ...
Getting scm site credentials for zip deployment
Starting zip deployment. This operation can take a while to complete ...
Deployment endpoint responded with status code 202

You can launch the app at http://udacity-azure-course-project2-cicd.azurewebsites.net
{
  "URL": "http://udacity-azure-course-project2-cicd.azurewebsites.net",
  "appserviceplan": "udacity-azure-course-project2-cicd-asp",
  "location": "westeurope",
  "name": "udacity-azure-course-project2-cicd",
  "os": "Linux",
  "resourcegroup": "udacity-azure-course-project2-rg",
  "runtime_version": "python|3.7",
  "runtime_version_detected": "-",
  "sku": "FREE",
  "src_path": "//home//anja//udacity-azure-course-project2"
}
```

* Project cloned into Azure Cloud Shell
![Screenshot project cloned into Azure Cloud Shelld](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/cloud-shell-cloned-github-repo-via-ssh.png?raw=true)

* Passing tests that are displayed after running the `make all` command from the `Makefile`
![Screenshot output of a test run](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/cloud-shell-make-all.png?raw=true)

* Output of a test run
![Screenshot output of a test run](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/build1-pass.png?raw=true)

* Successful deploy of the project in Azure Pipelines.  <TODO>.

* Running Azure App Service from Azure Pipelines automatic deployment <TODO>

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

In future, this project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Demo

<TODO: Add link Screencast on YouTube>


