# Overview

![Python application test with Github Actions](https://github.com/schildner/udacity-azure-course-project2/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)

This project was created for Project 2 submission of the [Udacity Azure DevOps Nanodegree Course](https://www.udacity.com/course/devops-engineer-for-microsoft-azure-nanodegree--nd082)
to demonstrate CI/CD techiques and skills acquired in the course. 

- Pushes to this GitHub repository's main branch trigger:
  * Continuous Integration pipeline on GitHub Actions. 
  * Continuous Delivery pipeline on Azure Pipelines.

The project contains a Python Flask WebApp which serves out housing prices predictions through API calls. The algorithm is based on pre-trained sklearn ML model for Boston area.

## Table of Contents

- [Demo](#demo)
- [Architectural Diagram](#architectural-diagram)
- [Project Plan](#project-plan)
- [Instructions](#instructions)
  * [Dependencies](#dependencies)
  * [Getting Started](#getting-started)
  * [Running the Python project](#running-the-python-project)
- [Alternative deployment via script using Terraform](#alternative-deployment-via-script-using-terraform)
- [Screenshots](#screenshots)
- [Future Enhancements](#future-enhancements)

## Demo

Link to screencast:

[![Project 2 Demo - CI/CD](https://i9.ytimg.com/vi_webp/hQhSaTQUA8M/mqdefault.webp?time=1611394500000&sqp=CMTbr4AG&rs=AOn4CLDRbvVygKSpjFm7TtPc4GK11GuGvw)](http://www.youtube.com/watch?v=hQhSaTQUA8M "Udacity Azure Devops Course Demo - Project 2 - CI/CD")

## Architectural Diagram

![Screenshot project cloned into Azure Cloud Shell](https://github.com/schildner/udacity-azure-course-project2/blob/main/azure-devops-project2-architecture.png?raw=true)

## Project Plan

* A link to a Trello board for the project: [Udacity Azure Course Project 2](https://trello.com/b/2bKbpU9v/udacity-azure-course-project-2)
* A link to a spreadsheet that includes the original and final project plan: [Spreadsheet on Google Drive](https://docs.google.com/spreadsheets/d/1VvhKAVZM7I1qVYufkkjYf5vR3nBcCQtji21aupZyXik/edit?usp=sharing)
  * (Contains 5 sheets: Yearly Project Management Plan, Q1, Q2, Q3, Q4)

## Instructions

### Dependencies

1. Create an [Azure Account](https://portal.azure.com)
2. Create a [GitHub Account](https://github.com)
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

5. Fork this repository and clone it into your azure cloud shell. Adapt the URL to match your forked repo:

```bash
user@Azure:~/ git clone git@github.com:schildner/udacity-azure-course-project2.git
```

6. Make sure the following environment variables are set and correspond to your azure account details:

* ARM_CLIENT_ID
* ARM_CLIENT_SECRET
* ARM_SUBSCRIPTION_ID
* ARM_TENANT_ID

See the account details:

```bash
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

## Running the Python project

1. While still in Azure cloud shell cd into the project dir:

```bash
user@Azure:~/ cd udacity-azure-course-project2
```

2. Install & activate virtual environment, install dependencies:

```bash
user@Azure:~/udacity-azure-course-project2/ make setup && make install
```

3. Create a webapp and deploy code from a local workspace to the app.

The command is required to run from the folder where the code is present. If necessary adapt parameter values for webapp name (-n; needs to be unique), location (-l) and sku.

Example:

```bash
user@Azure:~/udacity-azure-course-project2/ az webapp up \
                -n udacity-azure-course-project2-cicd-appservice \
                -l westeurope \
                --sku B1
```

This should result in the app running in the cloud and being accessible from the internet.
Expected output for successfull deployment:

```bash
The webapp 'udacity-azure-course-project2-cicd' doesn't exist
Creating webapp 'udacity-azure-course-project2-cicd' ...
Configuring default logging for the app, if not already enabled
Creating zip with contents of dir /home/user/udacity-azure-course-project2 ...
Getting scm site credentials for zip deployment
Starting zip deployment. This operation can take a while to complete ...
Deployment endpoint responded with status code 202

You can launch the app at http://udacity-azure-course-project2-cicd.azurewebsites.net
{
  "URL": "http://udacity-azure-course-project2-cicd.azurewebsites.net",
  "appserviceplan": "udacity-azure-course-project2-cicd-asp",
  "location": "westeurope",
  "name": "udacity-azure-course-project2-cicd-appservice",
  "os": "Linux",
  "resourcegroup": "udacity-azure-course-project2-rg",
  "runtime_version": "python|3.7",
  "runtime_version_detected": "-",
  "sku": "FREE",
  "src_path": "//home//user//udacity-azure-course-project2"
}
```

4. Export resource group name

If --resource-group was not supplied it gets created automatically. It's handy to export its name to an env variable:

```bash
user@Azure:~/udacity-azure-course-project2/ export RG_WEBAPP=udacity-azure-course-project2-rg
```

5. Double check app is running by going to http://udacity-azure-course-project2-cicd-appservice.azurewebsites.net in your browser.

You should see the default webapp title: Sklearn Prediction Home

6. Run a script to predict price for set of housing location related parameters supplied in the following script:

If necessary adapt the URL in the script to match the app's URL. Successful response looks like the one below.

```bash
user@Azure:~/udacity-azure-course-project2/ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

7. (Optionally) Run load test from azure cloud shell to see how the app behaves under simulated load:

For more details about load tests with locust see the file load_test.sh for some insights .

```bash
user@Azure:~/udacity-azure-course-project2/ locust -f locustfile.py --headless -u 100 -r 10 -t 30s
```

## Alternative deployment via script using Terraform

1. Go into the cloned project's directory and run the script commands.sh:

```bash
user@Azure:~/$ cd udacity-azure-course-project2
user@Azure:~/udacity-azure-course-project2$ ./commands.sh
```

This should have created the resource group and app service plan using Terraform:
udacity-azure-course-project2-cicd-rg
udacity-azure-course-project2-cicd-asp

And also deployed the python project to Azure App Service using same command as in the Running the Python project section - using the command az webapp up.

## Screenshots

* Project running on Azure App Service
![Screenshot project running Azure Portal](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/webapp-running-portal.png?raw=true)

![Screenshot project running Homepage](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/webapp-running-homepage.png?raw=true)

* Project cloned into Azure Cloud Shell
![Screenshot project cloned into Azure Cloud Shell](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/cloud-shell-project-cloned.png?raw=true)

* Passing tests that are displayed after running the `make all` command from the `Makefile`
![Screenshot output of a test run](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/cloud-shell-make-all.png?raw=true)

* Output of a test run
![Screenshot output of a test run](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/cloud-shell-run-tests.png?raw=true)

* Successful run of CD in Azure Pipelines.
![Screenshot stages in Azure Pipelines](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/azure-pipelines-stages.png?raw=true)

* Successful deploy of the project in Azure Pipelines (automatic deployment).
![Screenshot deploy in Azure Pipelines](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/deploy-azure-pipelines.png?raw=true)

* Successful prediction from deployed flask app in Azure Cloud Shell.
![Screenshot run prediction](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/run-prediction.png?raw=true)

* Successful load test run with Locust run in Azure Cloud Shell.
![Screenshot load test](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/locust-load-test-run.png?raw=true)

The screenshot above illustrates execution of the locust command which (as per load test definition in locustfile.py) simulates 10 users accessing the webapp's URL and generating get and post requests repeatedly for the duration of 5 seconds. To run it, just execute: 

```bash
udacity@Azure:~$ locust -f locustfile.py --headless -u 10 -r 5 -t 5s
```

* Output of streamed log files from deployed application
![Screenshot application logs](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/logs.png?raw=true)

Logs can be streamed by:

```bash
udacity@Azure:~$ az webapp log tail \
    --name udacity-azure-course-project2-cicd-appservice \
    --resource-group $RG_WEBAPP
```

Adapt the name or resource-group parameters to match the actual webapp name and resource group should they be different to your setup.

## Future Enhancements

- This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

- One pipeline combining CI and CD would be tidier but it was a lesson of this project to learn both: GitHub Actions and Azure Pipelines.
