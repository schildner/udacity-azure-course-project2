import json
import time
from locust import HttpUser, task

class QuickstartUser(HttpUser):
    host = "https://udacity-azure-course-project2-cicd-appservice.azurewebsites.net:443"

    #@task
    #def hello_world(self):
    #    self.client.get("/")
  
    @task
    def predict(self):
        payload = { 
            "CHAS": {"0": 0}, 
            "RM": {"0": 6.575},
            "TAX": {"0": 296.0}, 
            "PTRATIO": {"0": 15.3}, 
            "B": {"0": 396.9}, 
            "LSTAT": {"0": 4.98} 
        }

        for item in range(10):
            #jsonData = json.dumps(payload)
            #print(jsonData)
            response = self.client.post("/predict", json=payload, headers={'Content-Type': 'application/json'})
            time.sleep(1)
