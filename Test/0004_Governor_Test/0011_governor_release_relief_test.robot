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

Verify Governor Can Dispense Cash When There Is Heroes
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    
    ${current_total_sum}=    HelpFunction.curl_get_relief_summary_relief
    Set Initial Number Of Heroes
    IF    ${initial_number_of_heroes} == ${0}
        Skip
    END
    Click On Dispense Now Button
    Sleep    5s
    Wait Until Element Is Visible    xpath://*[@id="app"]/div/main/div/div/div
    Element Text Should Be    xpath://*[@id="app"]/div/main/div/div/div    Cash dispensed
    Open Website The Oppenheimer Project