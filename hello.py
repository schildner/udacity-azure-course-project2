import json

def toyou(x):
    return "hi %s" % x


def add(x):
    return x + 1


def subtract(x):
    return x - 1


def json_payload(): 
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

json_payload()

print("Status code: ", response.status_code)
print("Printing Entire Post Request")
print(response.json())