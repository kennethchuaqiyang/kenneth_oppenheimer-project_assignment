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
Verify Retrieve One Hero With Zero Relief Upon Entry And Refresh Tax Relief Table Button
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project



    ${filename}  Evaluate  ${Retrival_Zero_Relief_1_Person_Check}    
    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes
    ${national_id}    Set Variable    0007
    Set Global Variable    ${national_id}
    Check For Valid Added National ID
    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0
    Log To Console    dfnksalfndalsfndaslkvndasklfndlafnalskdfn

    FOR    ${index}    IN RANGE    1    ${subsequent_number_of_heroes}+1
        ${var} =    Get Text    xpath://*[@id="contents"]/div[2]/table/tbody/tr[${index}]/td[1]
        # ${check_id_match} =    HelpFunction.check_two_national_id ${national_id} ${var}
        ${check_id_match} =    Helpfunction.check_two_national_id  ${national_id}  ${var}
        Log To Console    message123213131
        IF    ${check_id_match} 
            Log To Console    ${index}
            ${hero_relief_from_table} =    Get Text    xpath://*[@id="contents"]/div[2]/table/tbody/tr[${index}]/td[2]
        END
 
    END
    Log To Console    FDAFFAFASFDASFSAFASFASDFADSF
    Log To Console    ${hero_relief_from_table}
    ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}
    Log To Console   ${hero_relief_from_databaase}
    IF    ${hero_relief_from_databaase} == ${hero_relief_from_table}
        Pass Execution    Bookeeper is able to retrieve 1 user with zero relief
    ELSE
        Fail
    END
    ${log entries}=    Get Browser Console Log Entries    
    Log    ${log entries}