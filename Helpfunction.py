import os
import requests

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
    return os.getcwd()+item

def round_to_2_dp(price):
    if price == 0:
        return price 
    
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


def check_init_text(init_text):
    return init_text == "No records at the moment 😢"