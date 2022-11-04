import requests
headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
response = requests.get('http://localhost:8080/calculator/taxRelief', headers=headers)
prices = response.json()
print(prices)
list =[]
for i in prices:
    list.append(float(i["relief"]))
print(sum(list))