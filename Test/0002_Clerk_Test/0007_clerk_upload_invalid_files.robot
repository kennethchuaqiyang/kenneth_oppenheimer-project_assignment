*** Settings ***
Documentation    Login Functionality
Library    SeleniumLibrary
Library    XML
Library    ../Functest.py
Library    ../../Helpfunction.py
Library    Collections
Resource    ../../Resources/resources.robot    


*** Variables ***
${initial_rows}
${init_text}

*** Test Cases ***

Verify Clerk Cannot Upload Non Existing Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    Skip
    

    Get Number Of Heroes
    Set Initial Number Of Heroes


    ${filename}  Evaluate  ${Non_Existing_CSV}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9999
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID
    FOR    ${nat_id}    IN    @{nat_id_list}
        ${national_id}    Set Variable    ${nat_id}
        Set Global Variable    ${national_id}
        Check For Valid Added National ID
        
    END
    ${log entries}=    Get Browser Console Log Entries    
    Log    ${log entries}



Verify Clerk Cannot Upload Invalid File Type Excel Non Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes


    ${filename}  Evaluate  ${Invalid_Non_CSV_Excel_File}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9999
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID
    # FOR    ${nat_id}    IN    @{nat_id_list}
    #     ${national_id}    Set Variable    ${nat_id}
    #     Set Global Variable    ${national_id}
    #     Check For Valid Added National ID
        
    # END
    # ${log entries}=    Get Browser Console Log Entries    
    # Log    ${log entries}

Verify Clerk Cannot Upload Invalid File Type Excel Non Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes


    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9999
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of Zero Hero Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_zero_hero_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END

Verify Clerk Cannot Process Invalid Upload Of Zero Hero Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_zero_hero_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column

Verify Clerk Cannot Process Empty Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_empty_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END

Verify Clerk Cannot Process Empty Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_empty_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END


Verify Clerk Cannot Process Invalid Upload Of One Hero With No Header Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_no_header_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9999
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Header Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_no_header_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9999
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With No Birthday Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_no_birthdate_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9998
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Birthday Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_no_birthdate_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9998
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Birthday DDMMMYYYY Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_birthdate_format_DDMMMYYYY_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9997
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Birthday DDMMMYYYY Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_birthdate_format_DDMMMYYYY_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9997
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Birthday YYYYMMDD Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_birthdate_format_YYYYMMDD_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9996
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Birthday YYYYMMDD Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_birthdate_format_YYYYMMDD_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9996
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With Long Form Gender Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_gender_long_form_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9995
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Long Form Gender Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_gender_long_form_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9995
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Gender Number Format Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    
    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_gender_number_requirement_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9994
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Gender Number Format Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    
    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_gender_number_requirement_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9994
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With No Salary Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_no_salary_form_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9993
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Salary Input Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_no_salary_form_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9993
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Salary Input Format Alphabets Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_form_alphabet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9992
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Salary Input Format Alphabets Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_form_alphabet_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9992
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Salary Input Format AlphaNumeric Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_form_alphanumeric_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9991
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Salary Input Format AlphaNumeric Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_form_alphanumeric_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9991
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Negative Salary Input Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_negative_salary_form_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9990
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Negative Salary Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_negative_salary_form_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9990
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With 5 Decimal Places Salary Input Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_5dp_form_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9989
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With 5 Decimal Places Salary Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_5dp_form_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9989
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With No Tax Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_no_tax_form_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9988
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Tax Input Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_no_tax_form_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9988
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Tax Input Format Alphabets Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_form_alphabet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9987
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Tax Input Format Alphabets Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_form_alphabet_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9987
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Tax Input Format AlphaNumeric Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_form_alphanumeric_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9986
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Tax Input Format AlphaNumeric Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_form_alphanumeric_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9986
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Negative Tax Input Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_negative_tax_form_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9985
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Negative Tax Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_negative_tax_form_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9985
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With 5 Decimal Places Tax Input Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_5dp_form_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9984
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With 5 Decimal Places Tax Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_5dp_form_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9984
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With No Name Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_no_name_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9983
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Name Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_no_name_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9983
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With No National Id Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_no_nat_id_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    # ${national_id}    Set Variable    9983
    # Set Global Variable    ${national_id}
    # Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No National Id Csv Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_no_nat_id_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    # ${national_id}    Set Variable    9983
    # Set Global Variable    ${national_id}
    # Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid National Id Format Less Than 4 Character Input Csv Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    Skip
    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_less_than_4_char_nat_id_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    # ${national_id}    Set Variable    9983
    # Set Global Variable    ${national_id}
    # Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid National Id Format Less Than 4 Character Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    Skip
    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_less_than_4_char_nat_id_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    # ${national_id}    Set Variable    9983
    # Set Global Variable    ${national_id}
    # Check For Non Valid Not Added National ID


#Skip One Row
#Skip One Column
#Jumbled Column
#1 valid and 1 invalid

Verify Clerk Cannot Process Invalid Upload Csv File With Empty Rows Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_empty_row_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9982
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload CSV With Empty Row Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_empty_row_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9982
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Csv File With Empty Column Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_empty_column_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9981
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload CSV With Empty Column Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_empty_column_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9981
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID


    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9981
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID



Verify Clerk Cannot Process Invalid Upload Csv File With Missing Column Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_missing_column_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    ${national_id}    Set Variable    9979
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload CSV With Missing Column Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_missing_column_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${0}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    9979
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

#Skip One Row
#Skip One Column
#Jumbled Column
#1 valid and 1 invalid