import os
import requests
import csv

def curl_get_user():
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    response = requests.get('http://localhost:8080/calculator/taxRelief', headers=headers)
    returned_json = response.json()
    return  returned_json




def curl_get_relief_summary_users():
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    response = requests.get('http://localhost:8080/calculator/taxReliefSummary', headers=headers)
    returned_json = response.json()
    return  returned_json["totalWorkingClassHeroes"]

def curl_get_relief_summary_relief():
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    response = requests.get('http://localhost:8080/calculator/taxReliefSummary', headers=headers)
    returned_json = response.json()
    return  returned_json["totalTaxReliefAmount"]

def working_directory(item):
    return os.getcwd()+'/Csv'+item

def round_to_2_dp(price):
    if price == 0:
        return format(price, '.0f') 
    
    return format(price, '.2f')

def splittextforcheckprice(sentence, tax_relief):
    if str(tax_relief) in sentence:
        return True
    return False

def splittextforpeople(sentence, numberOfPeople):
    if str(numberOfPeople) in sentence:
        return True
    return False

def get_number_of_users():
    users = curl_get_user()

    return len(users)

def get_total_relief():
    prices = curl_get_user()
    list =[]
    for i in prices:
        list.append(float(i["relief"]))
    return sum(list)

def get_user_relief(nat_id):
    heroes = curl_get_user()
    
    for hero in heroes:
        if hero["natid"]==nat_id:
            return hero["relief"]
    return -1


def check_init_text(init_text):
    return init_text == "No records at the moment 😢"

def post_file_api(file_to_be_uploaded):
    refined_filename = file_to_be_uploaded[1:]
    removed_quote_filename = refined_filename.replace('"', '')
    filename=os.getcwd()+'/Csv/'+removed_quote_filename
    file = {'file': open(filename, 'rb')}
    response = requests.post('http://localhost:8080/calculator/uploadLargeFileForInsertionToDatabase', files=file)
    return response.text, response.status_code

def check_success_response(response):
    if 'Successfully uploaded' in response[0] and '200' in str(response[1]):
        return True
    
    return False

def create_national_id(number_of_people):
    unprocessed_id = str(number_of_people)
    if len(unprocessed_id)==1:
        return "000"+unprocessed_id
    if len(unprocessed_id)==2:
        return "00"+unprocessed_id
    if len(unprocessed_id)==3:
        return "0"+unprocessed_id
    return unprocessed_id

def check_two_national_id(id1, id2):
    return id1==id2

def create_csv_file_by_requirement(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax):
    fileName = "uploadFile.csv"
    filePath = "./Csv" 
    current_number_of_people = get_number_of_users()
    nat_id_list = []
    for i in range (number_of_people):
        nat_id_list.append(create_national_id(current_number_of_people+i))
    
    path = os.path.join(filePath, fileName)
    if is_random_salary_tax==False:
        with open(path, "w") as csvFile:
            fieldnames = ['birthday', 'gender', 'name', 'natid', 'salary', 'tax']
            writer = csv.DictWriter(csvFile, fieldnames=fieldnames)

            writer.writeheader()
            for id in nat_id_list:
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+id, 'natid':id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list


def create_single_zero_requiremenet_csv():
    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'm', False, '0','0')
    return nat_id_list

def create_two_zero_requiremenet_csv():
    nat_id_list=create_csv_file_by_requirement(2, '01012018', 'm', False, '0','0')
    return nat_id_list