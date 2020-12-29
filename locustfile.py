import json
import time
from locust import HttpUser, task

class QuickstartUser(HttpUser):
    host = "https://udacity-azure-course-project2-cicd-appservice.azurewebsites.net:443"

    @task
    def hello_world(self):
        self.client.get("/")
  
    @task(3)
    def view_item(self):
        payload = { 
            "CHAS": {"0": 0}, 
            "RM": {"0": 6.575},
            "TAX": {"0": 296.0}, 
            "PTRATIO": {"0": 15.3}, 
            "B": {"0": 396.9}, 
            "LSTAT": {"0": 4.98} 
        }

        for item_id in range(10):
            #jsonData = json.dumps(payload)
            #print(jsonData)
            response = self.client.post("/predict", payload)
            print("Response status code:", response.status_code)
            print("Response text:", response.text)
            time.sleep(1)
