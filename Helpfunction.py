import os
import requests
import csv
import random

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

def check_non_success_response(response):
    if '500' in str(response[1]):
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
    print("testing for zero")
    print(nat_id_list)
    path = os.path.join(filePath, fileName)
    if is_random_salary_tax==False:
        with open(path, "w") as csvFile:
            fieldnames = ['birthday', 'gender', 'name', 'natid', 'salary', 'tax']
            writer = csv.DictWriter(csvFile, fieldnames=fieldnames)

            writer.writeheader()
            for id in nat_id_list:
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+id, 'natid':id, 'salary':fixed_salary, 'tax':fixed_tax})
    else:
        with open(path, "w") as csvFile:
            fieldnames = ['birthday', 'gender', 'name', 'natid', 'salary', 'tax']
            writer = csv.DictWriter(csvFile, fieldnames=fieldnames)

            writer.writeheader()
            for id in nat_id_list:
                birthday= str(random.randint(10, 28))+str(random.randint(10, 12))+str(random.randint(1982, 2018))
                gender = random.choice(["m","f"])
                fixed_salary=str(round(random.uniform(2000, 8000.66), 2))
                fixed_tax=str(round(random.uniform(200, 800.66), 2))
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+id, 'natid':id, 'salary':fixed_salary, 'tax':fixed_tax})        

    return nat_id_list

def create_csv_file_by_requirement_default_name(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax, name):
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
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':name, 'natid':id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

def create_csv_file_by_requirement_default_natid(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax, id):
    fileName = "uploadFile.csv"
    filePath = "./Csv" 
    # current_number_of_people = get_number_of_users()
    nat_id_list = []
    if len(id)>4:
        new_id = id[0:4]
        for i in range(0, len(id)-4):
            new_id= new_id + '$'
        id = new_id
    nat_id_list.append(id)
    # for i in range (number_of_people):
    #     nat_id_list.append(create_national_id(current_number_of_people+i))
    
    path = os.path.join(filePath, fileName)
    if is_random_salary_tax==False:
        with open(path, "w") as csvFile:
            fieldnames = ['birthday', 'gender', 'name', 'natid', 'salary', 'tax']
            writer = csv.DictWriter(csvFile, fieldnames=fieldnames)

            writer.writeheader()
            for id in nat_id_list:
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+id, 'natid':id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

def create_csv_file_by_requirement_no_header(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax):
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

            # writer.writeheader()
            for id in nat_id_list:
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+id, 'natid':'9999', 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

def create_invalid_csv_file_excluding_nat_id_by_requirement(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax, nat_id):
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
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+nat_id, 'natid':nat_id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

def create_invalid_csv_file_no_name_by_requirement(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax, nat_id):
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
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'', 'natid':nat_id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

def create_invalid_csv_file_excluding_nat_id_by_requirement_append_one_empty_row(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax, nat_id):
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
            writer.writerow({'birthday':'', 'gender':'', 'name':'', 'natid':'', 'salary':'', 'tax':''})
            for id in nat_id_list:
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+nat_id, 'natid':nat_id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

def create_invalid_csv_file_excluding_nat_id_by_requirement_append_one_empty_column(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax, nat_id):
    fileName = "uploadFile.csv"
    filePath = "./Csv" 
    current_number_of_people = get_number_of_users()
    nat_id_list = []
    for i in range (number_of_people):
        nat_id_list.append(create_national_id(current_number_of_people+i))
    
    path = os.path.join(filePath, fileName)
    if is_random_salary_tax==False:
        with open(path, "w") as csvFile:
            fieldnames = ['','birthday', 'gender', 'name', 'natid', 'salary', 'tax']
            writer = csv.DictWriter(csvFile, fieldnames=fieldnames)

            writer.writeheader()
            for id in nat_id_list:
                writer.writerow({'':'','birthday':birthday, 'gender':gender, 'name':'test1'+nat_id, 'natid':nat_id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

def create_valid_csv_file_excluding_nat_id_by_requirement_append_jumbled_columns(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax):
    fileName = "uploadFile.csv"
    filePath = "./Csv" 
    current_number_of_people = get_number_of_users()
    nat_id_list = []
    for i in range (number_of_people):
        nat_id_list.append(create_national_id(current_number_of_people+i))
    
    path = os.path.join(filePath, fileName)
    if is_random_salary_tax==False:
        with open(path, "w") as csvFile:
            fieldnames = ['gender', 'name', 'natid', 'salary', 'tax', 'birthday']
            writer = csv.DictWriter(csvFile, fieldnames=fieldnames)

            writer.writeheader()
            for id in nat_id_list:
                writer.writerow({'gender':gender, 'name':'test1'+id, 'natid':id, 'salary':fixed_salary, 'tax':fixed_tax,'birthday':birthday})
    return nat_id_list

def create_invalid_csv_file_excluding_nat_id_by_requirement_append_missing_columns(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax, nat_id):
    fileName = "uploadFile.csv"
    filePath = "./Csv" 
    current_number_of_people = get_number_of_users()
    nat_id_list = []
    for i in range (number_of_people):
        nat_id_list.append(create_national_id(current_number_of_people+i))
    
    path = os.path.join(filePath, fileName)
    if is_random_salary_tax==False:
        with open(path, "w") as csvFile:
            fieldnames = ['gender', 'name', 'natid', 'salary', 'tax']
            writer = csv.DictWriter(csvFile, fieldnames=fieldnames)

            writer.writeheader()
            for id in nat_id_list:
                writer.writerow({'gender':gender, 'name':'test1'+nat_id, 'natid':nat_id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

def create_invalid_csv_file_excluding_nat_id_by_requirement_append_always_one_invalid_row(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax, nat_id):
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
            writer.writerow({'birthday':'01012019', 'gender':'Male', 'name':'Invalid', 'natid':'1234', 'salary':'0', 'tax':'0'})
            for id in nat_id_list:
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+nat_id, 'natid':nat_id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

def create_single_zero_requiremenet_csv():
    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'm', False, '0','0')
    return nat_id_list

def create_single_full_details_requiremenet_csv():
    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'm', False, '1000','100')
    return nat_id_list

def create_mass_full_details_requirement_csv():
    nat_id_list=create_csv_file_by_requirement(50, '01012018', 'm', True, '1000','100')
    return nat_id_list

def create_single_full_details_requiremenet_big_M_csv():
    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'M', False, '1000','100')
    return nat_id_list

def create_single_full_details_requiremenet_small_f_csv():
    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'f', False, '1000','100')
    return nat_id_list

def create_single_full_details_requiremenet_big_F_csv():
    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'F', False, '1000','100')
    return nat_id_list

def create_single_full_details_requiremenet_no_gender_csv():
    nat_id_list=create_csv_file_by_requirement(1, '01012018', '', False, '1000','100')
    return nat_id_list

def create_single_full_details_requiremenet_chinese_gender_csv():
    nat_id_list=create_csv_file_by_requirement(1, '01012018', '男', False, '1000','100')
    return nat_id_list

def create_single_full_details_higher_tax_requiremenet_csv():
    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'm', False, '100','1000')
    return nat_id_list

def create_name_with_letters_csv():
    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', 'QaTest')
    return nat_id_list

def create_name_with_numbers_csv():
    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', '1234')
    return nat_id_list

def create_name_with_alphanumerics_csv():
    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', 'qatest1234')
    return nat_id_list

def create_name_with_space_csv():
    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', 'qatest 1234')
    return nat_id_list

def create_name_with_specialcharacters_csv():
    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', '~!@#$%^&*()_":<>?')
    return nat_id_list

def create_name_with_chinesecharacters_csv():
    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', '早上好')
    return nat_id_list
# TBC
def create_id_with_4_numbers_id_csv():
    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', '1234')
    return nat_id_list

def create_id_with_4_letters_id_csv():
    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', 'abcd')
    return nat_id_list

def create_id_with_4_alphanumeric_id_csv():
    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', 'ab12')
    return nat_id_list

def create_id_with_4_id_with_space_csv():
    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', 'ab d')
    return nat_id_list

def create_id_with_4_id_with_special_character_csv():
    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', '!@#%')
    return nat_id_list

def create_id_with_4_id_with_chinese_character_csv():
    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', '早上好好')
    return nat_id_list

def create_id_with_9_alphanumeric_id_csv():
    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', 'T1215321U')
    return nat_id_list

def create_two_zero_requiremenet_csv():
    nat_id_list=create_csv_file_by_requirement(2, '01012018', 'm', False, '0','0')
    return nat_id_list

def create_zero_hero_requiremenet_csv():
    nat_id_list=create_csv_file_by_requirement(0, '01012018', 'm', False, '0','0')
    return nat_id_list

def create_no_header_requiremenet_csv():
    nat_id_list=create_csv_file_by_requirement_no_header(1, '01012018', 'm', False, '0','0')
    return nat_id_list

def create_empty_csv():
    nat_id_list=create_csv_file_by_requirement_no_header(0, '01012018', 'm', False, '0','0')
    return nat_id_list

def create_hero_no_birthdate_requiremenet_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '', 'm', False, '0','0', '9998')
    return nat_id_list

def create_hero_invalid_birthdate_format_DDMMMYYYY_requiremenet_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '1-Jan-2018', 'm', False, '0','0', '9997')
    return nat_id_list

def create_hero_invalid_birthdate_format_YYYYMMDD_requiremenet_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '20180101', 'm', False, '0','0', '9996')
    return nat_id_list

def create_hero_invalid_gender_long_form_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'male', False, '0','0', '9995')
    return nat_id_list

def create_hero_invalid_gender_number_requirement_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', '1', False, '0','0', '9994')
    return nat_id_list

def create_hero_no_salary_form_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '','0', '9993')
    return nat_id_list

def create_hero_invalid_salary_form_alphabet_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '£','0', '9992')
    return nat_id_list

def create_hero_invalid_salary_form_alphanumeric_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '£1.00','0', '9991')
    return nat_id_list

def create_hero_invalid_negative_salary_form_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '-1.00','0', '9990')
    return nat_id_list

def create_hero_invalid_salary_5dp_form_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '1.00005','0', '9989')
    return nat_id_list

def create_hero_no_tax_form_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '0','', '9988')
    return nat_id_list

def create_hero_invalid_tax_form_alphabet_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '£', '9987')
    return nat_id_list

def create_hero_invalid_tax_form_alphanumeric_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '£1.00', '9986')
    return nat_id_list

def create_hero_invalid_negative_tax_form_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '-1.00', '9985')
    return nat_id_list

def create_hero_invalid_tax_5dp_form_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '1.00005', '9984')
    return nat_id_list

def create_no_name_csv():
    nat_id_list=create_invalid_csv_file_no_name_by_requirement(1, '01012018', 'm', False, '0','0', '9983')
    return nat_id_list

def create_less_than_4_char_nat_id_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '0', 'ab')
    return nat_id_list

def create_no_nat_id_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '0', '')
    return nat_id_list

def create_empty_row_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement_append_one_empty_row(1, '01012018', 'm', False,'0', '1.00', '9982')
    return nat_id_list

def create_empty_column_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement_append_one_empty_column(1, '01012018', 'm', False,'0', '1.00', '9981')
    return nat_id_list

def create_jumbled_column_csv():
    nat_id_list=create_valid_csv_file_excluding_nat_id_by_requirement_append_jumbled_columns(1, '01012018', 'm', False,'0', '1.00')
    return nat_id_list

def create_missing_column_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement_append_missing_columns(1, '01012018', 'm', False,'0', '1.00', '9979')
    return nat_id_list

def create_mixture_of_invalid_and_valid_data_csv():
    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement_append_always_one_invalid_row(1, '01012018', 'm', False,'0', '1.00', '9978')
    return nat_id_list

