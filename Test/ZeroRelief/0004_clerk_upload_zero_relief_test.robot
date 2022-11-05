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
Verify Valid Upload Of One Person ID 0000 With Zero Relief By Setting Tax And Salary To Zero Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    # Log To Console    yadadadadda
    # Log To Console    ${initial_number_of_heroes}

    ${filename}  Evaluate  ${FE_Zero_Relief_1_Person_Check}    
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
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    ${national_id}    Set Variable    0000
    Set Global Variable    ${national_id}
    Check For Valid Added National ID

    # ${log entries}=    Get Browser Console Log Entries    
    # Log    ${log entries}

Verify Valid Upload Of One Person ID 0001 With Zero Relief By Setting Tax And Salary To Zero Via API call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    



    ${response} =    Helpfunction.post_file_api    ${API_Zero_Relief_1_Person_Check}
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
    ${national_id}    Set Variable    0001
    Set Global Variable    ${national_id}
    Check For Valid Added National ID

    # ${log entries}=    Get Browser Console Log Entries    
    # Log    ${log entries}


Verify Valid Upload Of Two Person ID 0003 And 0004 With Zero Relief By Setting Tax And Salary To Zero Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    # Log To Console    yadadadadda
    # Log To Console    ${initial_number_of_heroes}

    ${filename}  Evaluate  ${FE_Zero_Relief_2_Person_Check}    
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
    ${national_id}    Set Variable    0003
    Set Global Variable    ${national_id}
    Check For Valid Added National ID

    ${national_id}    Set Variable    0004
    Set Global Variable    ${national_id}
    Check For Valid Added National ID

    # ${log entries}=    Get Browser Console Log Entries    
    # Log    ${log entries}

Verify Valid Upload Of Two Person ID 0005 And 0006 With Zero Relief By Setting Tax And Salary To Zero Via API call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    



    ${response} =    Helpfunction.post_file_api    ${API_Zero_Relief_2_Person_Check}
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
    ${national_id}    Set Variable    0005
    Set Global Variable    ${national_id}
    Check For Valid Added National ID
    ${national_id}    Set Variable    0006
    Set Global Variable    ${national_id}
    Check For Valid Added National ID
    # ${log entries}=    Get Browser Console Log Entries    
    # Log    ${log entries}
