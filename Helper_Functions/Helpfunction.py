import os
import requests
import csv
import random

#Api Call To Get Tax Relief
def curl_get_user():

    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    response = requests.get('http://localhost:8080/calculator/taxRelief', headers=headers)
    returned_json = response.json()
    return  returned_json

#Api Call To Get Relief Summary
def curl_get_relief_summary():

    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    response = requests.get('http://localhost:8080/calculator/taxReliefSummary', headers=headers)
    return response

#Get Users From API Get Relief Summary  
def curl_get_relief_summary_users():

    response = curl_get_relief_summary()
    returned_json = response.json()
    return  returned_json["totalWorkingClassHeroes"]

#Get Relief From API Get Relief Summary
def curl_get_relief_summary_relief():

    response = curl_get_relief_summary()
    returned_json = response.json()
    return  returned_json["totalTaxReliefAmount"]

#Get Current Working Directory So We Do Not Have To Worry About Where To Park The Csv File
def working_directory(file):

    return os.getcwd()+'/Csv'+file

#Round Data From Robot Framework To 2 Decimal Places
def round_to_2_dp(price):

    if price == 0:
        return format(price, '.0f') 
    return format(price, '.2f')

#Extract And Manipulate Relief From Statement For Ease Of Calculation
def obtainpricefromstatement(sentence):
    
    splitsentence=sentence.split()
    extractedPrice=round(float(splitsentence[0][1:]),2)
    return extractedPrice

#Examine If Tax Relief Correspond to The One Reflected In The Relief Statement
def splittextforcheckprice(sentence, tax_relief):
    
    if str(tax_relief) in sentence:
        return True
    return False

#Examine If Number Of Heroes Correspond To The One Reflected In the Relief Statement
def splittextforpeople(sentence, numberOfPeople):

    if str(numberOfPeople) in sentence:
        return True
    return False

#Get number Of Heroes From Api Calculator/taxRelief
def get_number_of_users():

    users = curl_get_user()
    return len(users)

#Calculate Total Relief From Api Calculator/taxRelief
def get_total_relief():

    prices = curl_get_user()
    list =[]
    for i in prices:
        list.append(float(i["relief"]))
    return sum(list)

#Get Relief Of Heroes Or Reflect -1
def get_user_relief(nat_id):

    heroes = curl_get_user()
    for hero in heroes:
        if hero["natid"]==nat_id:
            return hero["relief"]
    return -1

#Helper Function To Calculate Total Relief
def get_total_user_relief(nat_id):

    heroes = curl_get_user()
    total_specific_relief = 0
    for hero in heroes:
        if hero["natid"]==nat_id:
            total_specific_relief= total_specific_relief+ float(hero["relief"])
    return total_specific_relief

#Compare Initial Sentence
def check_init_text(init_text):

    return init_text == "No records at the moment 😢"

#API Call For Uploading File
def post_file_api(file_to_be_uploaded):

    refined_filename = file_to_be_uploaded[1:]
    removed_quote_filename = refined_filename.replace('"', '')
    filename=os.getcwd()+'/Csv/'+removed_quote_filename
    file = {'file': open(filename, 'rb')}
    response = requests.post('http://localhost:8080/calculator/uploadLargeFileForInsertionToDatabase', files=file)
    return response.text, response.status_code

#Check Successful API Call
def check_success_response(response):

    if 'Successfully uploaded' in response[0] and '200' in str(response[1]):
        return True
    return False

#Check Unsucussful API Call
def check_non_success_response(response):

    if '500' in str(response[1]):
        return True
    return False

#Helper Function To Help Create National Id For CSV
def create_national_id(number_of_people):

    unprocessed_id = str(number_of_people)
    if len(unprocessed_id)==1:
        return "000"+unprocessed_id
    if len(unprocessed_id)==2:
        return "00"+unprocessed_id
    if len(unprocessed_id)==3:
        return "0"+unprocessed_id
    return unprocessed_id

#Helper Function To Compare Two National Ids
def check_two_national_id(id1, id2):

    return id1==id2

#Creating Csv File With Automatic National Id And Name
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

#Creating Csv File With Predefined Name
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

#Create CSV File With Predefined National Id
def create_csv_file_by_requirement_default_natid(number_of_people, birthday, gender, is_random_salary_tax, fixed_salary, fixed_tax, id):

    fileName = "uploadFile.csv"
    filePath = "./Csv" 
    nat_id_list = []

    if len(id)>4:
        new_id = id[0:4]
        for i in range(0, len(id)-4):
            new_id= new_id + '$'
        id = new_id
    nat_id_list.append(id)
    
    path = os.path.join(filePath, fileName)

    if is_random_salary_tax==False:
        with open(path, "w") as csvFile:
            fieldnames = ['birthday', 'gender', 'name', 'natid', 'salary', 'tax']
            writer = csv.DictWriter(csvFile, fieldnames=fieldnames)
            writer.writeheader()

            for id in nat_id_list:
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+id, 'natid':id, 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

#Create CSV File Without Header
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

            for id in nat_id_list:
                writer.writerow({'birthday':birthday, 'gender':gender, 'name':'test1'+id, 'natid':'9999', 'salary':fixed_salary, 'tax':fixed_tax})
    return nat_id_list

#Auto Creation Of Invalid CSV File
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

#Create CSV File With No Name
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

#Create CSV File With Always One Empty Row
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

#Create CSV File With One Empty Column
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

#Create Jumbled Column CSV

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

#Create CSV With Missing One Header With Respective Column
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

#To Always Create One Invalid Row Of Data
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

#Create Single Zero Relief Hero
def create_single_zero_requiremenet_csv():

    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'm', False, '0','0')
    return nat_id_list

#Create Single Full Hero
def create_single_full_details_requiremenet_csv():

    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'm', False, '1000','100')
    return nat_id_list

#Create 50 Full Heroes
def create_mass_full_details_requirement_csv():

    nat_id_list=create_csv_file_by_requirement(50, '01012018', 'm', True, '1000','100')
    return nat_id_list

#Create Two Full Heroes
def create_two_full_random_details_requirement_csv():

    nat_id_list=create_csv_file_by_requirement(2, '01012018', 'm', True, '1000','100')
    return nat_id_list

#Create Big M Hero
def create_single_full_details_requiremenet_big_M_csv():

    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'M', False, '1000','100')
    return nat_id_list

#Create Small f Hero
def create_single_full_details_requiremenet_small_f_csv():

    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'f', False, '1000','100')
    return nat_id_list

#Create Big F Hero
def create_single_full_details_requiremenet_big_F_csv():

    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'F', False, '1000','100')
    return nat_id_list

#Create No Gender Hero
def create_single_full_details_requiremenet_no_gender_csv():

    nat_id_list=create_csv_file_by_requirement(1, '01012018', '', False, '1000','100')
    return nat_id_list

#Create Chinese Gender Hero
def create_single_full_details_requiremenet_chinese_gender_csv():
    
    nat_id_list=create_csv_file_by_requirement(1, '01012018', '男', False, '1000','100')
    return nat_id_list

#Create Hero With Higher Tax
def create_single_full_details_higher_tax_requiremenet_csv():

    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'm', False, '100','1000')
    return nat_id_list

#Create Hero With Equal Tax
def create_single_full_details_equal_tax_requiremenet_csv():

    nat_id_list=create_csv_file_by_requirement(1, '01012018', 'm', False, '1000','1000')
    return nat_id_list

#Create Heroes With Alphbet Name
def create_name_with_letters_csv():

    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', 'QaTest')
    return nat_id_list

#Create Heroes With Number Name
def create_name_with_numbers_csv():

    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', '1234')
    return nat_id_list

#Create Heroes With Alphanumerical Name
def create_name_with_alphanumerics_csv():

    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', 'qatest1234')
    return nat_id_list

#Create Name With Space
def create_name_with_space_csv():

    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', 'qatest 1234')
    return nat_id_list

#Create Name With Special Character
def create_name_with_specialcharacters_csv():

    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', '~!@#$%^&*()_":<>?')
    return nat_id_list

#Create Name With Chinese Character
def create_name_with_chinesecharacters_csv():

    nat_id_list=create_csv_file_by_requirement_default_name(1, '01012018', 'm', False, '100','1000', '早上好')
    return nat_id_list

#Create ID With 4 numerical id
def create_id_with_4_numbers_id_csv():

    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', '1234')
    return nat_id_list

#Create ID With 4 Alphabets
def create_id_with_4_letters_id_csv():

    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', 'abcd')
    return nat_id_list

#Create ID with 4 Alphanuerical Character
def create_id_with_4_alphanumeric_id_csv():

    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', 'ab12')
    return nat_id_list

#Create ID With Space Between
def create_id_with_4_id_with_space_csv():

    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', 'ab d')
    return nat_id_list

#Create ID With Special Character
def create_id_with_4_id_with_special_character_csv():

    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', '!@#%')
    return nat_id_list

#Create Id With 4 Chinese Character
def create_id_with_4_id_with_chinese_character_csv():

    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', '早上好好')
    return nat_id_list

#Create Id With 9 Alphanumeric
def create_id_with_9_alphanumeric_id_csv():

    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', 'T1215321U')
    return nat_id_list

#Create Two Heroes With Zero Relief
def create_two_zero_requiremenet_csv():

    nat_id_list=create_csv_file_by_requirement(2, '01012018', 'm', False, '0','0')
    return nat_id_list

#Create Single Hero With Zero Relief
def create_zero_hero_requiremenet_csv():

    nat_id_list=create_csv_file_by_requirement(0, '01012018', 'm', False, '0','0')
    return nat_id_list

#Create No Header
def create_no_header_requiremenet_csv():

    nat_id_list=create_csv_file_by_requirement_no_header(1, '01012018', 'm', False, '0','0')
    return nat_id_list

#Create Empty CSV
def create_empty_csv():

    nat_id_list=create_csv_file_by_requirement_no_header(0, '01012018', 'm', False, '0','0')
    return nat_id_list

#Create With No Birthday
def create_hero_no_birthdate_requiremenet_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '', 'm', False, '0','0', '9998')
    return nat_id_list

#Create Birthday With Format DD-MMM-YYYY(Invalid)
def create_hero_invalid_birthdate_format_DDMMMYYYY_requiremenet_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '1-Jan-2018', 'm', False, '0','0', '9997')
    return nat_id_list

#Create Birthday With Format YYMMDDDDD(Invalid)
def create_hero_invalid_birthdate_format_YYYYMMDD_requiremenet_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '20180101', 'm', False, '0','0', '9996')
    return nat_id_list

#Create Long Form Gender
def create_hero_invalid_gender_long_form_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'male', False, '0','0', '9995')
    return nat_id_list

#Create Invalid Gener '1'
def create_hero_invalid_gender_number_requirement_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', '1', False, '0','0', '9994')
    return nat_id_list

#Create No Salary
def create_hero_no_salary_form_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '','0', '9993')
    return nat_id_list

#Create Salary Using Alphabets(Invalid)
def create_hero_invalid_salary_form_alphabet_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '£','0', '9992')
    return nat_id_list

#Create Salary Using Alphanumeric(Invalid)
def create_hero_invalid_salary_form_alphanumeric_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '£1.00','0', '9991')
    return nat_id_list

#Create Negative Salary (Invalid)
def create_hero_invalid_negative_salary_form_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '-1.00','0', '9990')
    return nat_id_list

#Create 5dp Salary (Invalid)
def create_hero_invalid_salary_5dp_form_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '1.00005','0', '9989')
    return nat_id_list

#Create No Tax (Invalid)
def create_hero_no_tax_form_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False, '0','', '9988')
    return nat_id_list

#Create Alpabetical Tax (Invalid)
def create_hero_invalid_tax_form_alphabet_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '£', '9987')
    return nat_id_list

#Create Alphanumeric Tax (Invalid)
def create_hero_invalid_tax_form_alphanumeric_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '£1.00', '9986')
    return nat_id_list

#Create negative tax
def create_hero_invalid_negative_tax_form_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '-1.00', '9985')
    return nat_id_list

#Create 5dp tax (Invalid)
def create_hero_invalid_tax_5dp_form_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '1.00005', '9984')
    return nat_id_list

#Create No Name
def create_no_name_csv():

    nat_id_list=create_invalid_csv_file_no_name_by_requirement(1, '01012018', 'm', False, '0','0', '9983')
    return nat_id_list

#Create Less Than 4 character nat id
def create_less_than_4_char_nat_id_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '0', 'ab')
    return nat_id_list

#Create no national id
def create_no_nat_id_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '01012018', 'm', False,'0', '0', '')
    return nat_id_list

#Create Empty Row CSV
def create_empty_row_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement_append_one_empty_row(1, '01012018', 'm', False,'0', '1.00', '9982')
    return nat_id_list

#Create Empty Column CSV
def create_empty_column_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement_append_one_empty_column(1, '01012018', 'm', False,'0', '1.00', '9981')
    return nat_id_list

#Create Jumbled Column
def create_jumbled_column_csv():

    nat_id_list=create_valid_csv_file_excluding_nat_id_by_requirement_append_jumbled_columns(1, '01012018', 'm', False,'0', '1.00')
    return nat_id_list

#Create Missing Column
def create_missing_column_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement_append_missing_columns(1, '01012018', 'm', False,'0', '1.00', '9977')
    return nat_id_list

#Create Mixture of valid and invalid hero data rows
def create_mixture_of_invalid_and_valid_data_csv():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement_append_always_one_invalid_row(1, '01012018', 'm', False,'0', '1.00', '9978')
    return nat_id_list

#For Creating Duplicate CSV
def create_duplicated_ids_csv():

    nat_id_list= create_csv_file_by_requirement_default_natid(1, '01012018', 'm', False, '100','1000', '9979')
    return nat_id_list

#Create No Relief
def create_hero_for_invalid_entry_no_relief_calculation():

    nat_id_list=create_invalid_csv_file_excluding_nat_id_by_requirement(1, '1-Jan-2018', 'm', False, '0','0', '9996')
    return nat_id_list
