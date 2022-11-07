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
Verify Valid Upload Of One Hero With Zero Relief By Setting Tax And Salary To Zero Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_zero_requiremenet_csv
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
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Valid Upload Of One Hero With Zero Relief By Setting Tax And Salary To Zero Via API call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_zero_requiremenet_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

    # ${log entries}=    Get Browser Console Log Entries    
    # Log    ${log entries}


Verify Valid Upload Of Two Heroes With Zero Relief By Setting Tax And Salary To Zero Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_two_zero_requiremenet_csv
    Set Global Variable    @{nat_id_list}


    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    # Log To Console    yadadadadda
    # Log To Console    ${subsequent_number_of_heroes}

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${2}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

    # ${log entries}=    Get Browser Console Log Entries    
    # Log    ${log entries}

Verify Valid Upload Of Two Heroes With Zero Relief By Setting Tax And Salary To Zero Via API call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_two_zero_requiremenet_csv
    Set Global Variable    @{nat_id_list}



    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${2}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

    # ${log entries}=    Get Browser Console Log Entries    
    # Log    ${log entries}
