import requests
import os
import csv
import random
# headers = {'content-type': 'multipart/form-data'}
# filename=os.getcwd()+'/Zero_Relief_1_person_FE_Clark_check.csv'
# file = {'file': open(filename, 'rb')}
# response = requests.post('http://localhost:8080/calculator/uploadLargeFileForInsertionToDatabase', files=file)
# print(response)
# print(response.text)
# print(response.headers)
# print(response.status_code)

# fileName = "csvFileName.csv"
# filePath = "./Csv" 

# path = os.path.join(filePath, fileName)

# with open(path, "w") as csvFile:
#     fieldnames = ['birthday', 'gender', 'name', 'natid', 'salary', 'tax']
#     writer = csv.DictWriter(csvFile, fieldnames=fieldnames)

#     writer.writeheader()
#     writer.writerow({'birthday':'01012018', 'gender':'m', 'name':'test1', 'natid':'0005', 'salary':'0.1', 'tax':'0'})
# a = "abcdefgh"
# if len(a)>4:
#     create_a = a[0:4]
#     for i in range(0, len(a)-4):
#         create_a= create_a + '*'
# a = create_a
# print (a)
# birthday= str(random.randint(1982, 2018))+str(random.randint(10, 12))+str(random.randint(10, 28))
# print(birthday)
# gender = random.choice(["m","f"])
# print(gender)
# hope=str(round(random.uniform(1000, 2000.66), 2))
# print(hope)

# headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
# response = requests.get('http://localhost:8080/calculator/taxRelief', headers=headers)
# returned_json = response.json()
# heroes  =returned_json
# total_specific_relief = 0
# for hero in heroes:
#     for nat_id in nat_ids:
#         if hero["natid"]==nat_id:
#             print(hero["relief"])
#             total_specific_relief= total_specific_relief+ float(hero["relief"])
#     total_specific_relief