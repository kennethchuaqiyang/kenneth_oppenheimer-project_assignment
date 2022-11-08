*** Settings ***
Documentation    Login Functionality
Library    SeleniumLibrary
Library    XML
Library    ../../Helper_Functions/Helpfunction.py
Library    Collections
Resource    ../../Resources/resources.robot    


*** Variables ***
${initial_rows}
${init_text}

*** Test Cases ***

Verify Governor Can Dispense Cash Even when There Is Zero Relief

    [Documentation]  This test case verifies the governor can dispense cash if there is zero relief
    [Tags]  Governor    Dispense Cash    Zero Relief    Heroes Present
    
    ${current_total_sum}=    HelpFunction.curl_get_relief_summary_relief

    IF    ${current_total_sum} != 0

        Log    Skip this test if there is already relief in the database
        Skip

    END

        Click On Dispense Now Button
        Sleep    5s

        Wait Until Element Is Visible    xpath://*[@id="app"]/div/main/div/div/div
        Element Text Should Be    xpath://*[@id="app"]/div/main/div/div/div    Cash dispensed

        Log    Verified Governor Can Dispense Cash Even when There Is Zero Relief
        Open Website The Oppenheimer Project
