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
#To edit jumbled since it is valid
#valid will be chinese character, alphanumeric for name and id, id more than 4 char, upper lower M/F, 
Verify Clerk Can Process Invalid Upload Csv File With Jumbled Column Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    Skip
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_jumbled_column_csv
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
    ${national_id}    Set Variable    9980
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID

#To edit jumbled since it is valid

Verify Clerk Cannot Process Valid Upload CSV With Jumbled Column Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    Skip
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_jumbled_column_csv
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
    ${national_id}    Set Variable    9980
    Set Global Variable    ${national_id}
    Check For Non Valid Not Added National ID