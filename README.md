# Overview

This project contains a python flask app which serves out housing prices predictions through API calls.

The algorithm is based on pre-trained sklearn ML model for Boston area. 

## Project Plan

* A link to a Trello board for the project: [Udacity Azure Course Project 2](https://trello.com/b/2bKbpU9v/udacity-azure-course-project-2)
* A link to a spreadsheet that includes the original and final project plan: [Spreadsheet on Google Drive](https://docs.google.com/spreadsheets/d/1VvhKAVZM7I1qVYufkkjYf5vR3nBcCQtji21aupZyXik/edit?usp=sharing)

## Instructions

<TODO:  
* Architectural Diagram (Shows how key parts of the system work)>

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

Create a webapp and deploy code from a local workspace to the app. The command is required to run from the folder where the code is present. 
```bash
(.udacity-azure-course-project2) anja@Azure:~/udacity-azure-course-project2$ az webapp up \
      -n udacity-azure-course-project2-cicd \
      --sku F1 \
      --resource-group udacity-azure-course-project2-rg \
      -l westeurope

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
(.udacity-azure-course-project2) anja@Azure:~/udacity-azure-course-project2$
(.udacity-azure-course-project2) anja@Azure:~/udacity-azure-course-project2$
```

* Project cloned into Azure Cloud Shell
![Screenshot project cloned into Azure Cloud Shelld](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/cloud-shell-cloned-github-repo-via-ssh.png?raw=true)

* Passing tests that are displayed after running the `make all` command from the `Makefile`
![Screenshot output of a test run](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/cloud-shell-make-all.png?raw=true)

* Output of a test run
![Screenshot output of a test run](https://github.com/schildner/udacity-azure-course-project2/blob/main/screenshots/build1-pass.png?raw=true)


* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

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


