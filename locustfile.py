import time
import json
from locust import HttpUser, HttpBrowser, task

class QuickstartUser(HttpUser):

    host = "https://udacity-azure-course-project2-cicd-appservice.azurewebsites.net:443 "

    @task
    def predict(self):
        client = HttpBrowser("https://udacity-azure-course-project2-cicd-appservice.azurewebsites.net:443")

        payload = { 
            "CHAS": {"0": 0}, 
            "RM": {"0": 6.575},
            "TAX": {"0": 296.0}, 
            "PTRATIO": {"0": 15.3}, 
            "B": {"0": 396.9}, 
            "LSTAT": {"0": 4.98} 
        }
        
        jsonData = json.dumps(payload)
        print(jsonData)

        request = client.post("/predict", json=payload)