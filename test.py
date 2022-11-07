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
a = "abcdefgh"
if len(a)>4:
    create_a = a[0:4]
    for i in range(0, len(a)-4):
        create_a= create_a + '*'
a = create_a
print (a)