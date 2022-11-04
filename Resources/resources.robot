*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary
Library    XML
Library    Process
Library    Collections
Library    ../Helpfunction.py

*** Variables ***

${sum_of_price_from_table}
${number_of_users}
${initial_rows}
${relief_statement}
${api_relief_summary_heroes}
${api_relief_summary_total_relief}
${rounded_total_database_relief}

*** Keywords ***

Open Website The Oppenheimer Project

    Open Browser  http://localhost:8080/  Chrome

    Wait Until Element Is Visible    xpath://*[@id="contents-main"]


Get Users From Database

    Run Process    curl 'http://localhost:8080/calculator/taxRelief'

Calculate Total Price From Table
        
        ${init_table}=    SeleniumLibrary.Get Element Count    xpath://*[@id="contents"]/div[2]/table/tbody/tr

        @{PriceList}=    Create List

        FOR    ${index}    IN RANGE    1    ${init_table}+1

            ${var} =    Get Text    xpath://*[@id="contents"]/div[2]/table/tbody/tr[${index}]/td[2]
            Append To List    ${PriceList}    ${var}    
        END

        ${sum_of_price_from_table} =    Set Variable    ${0.00}
        FOR    ${element}    IN    @{PriceList}

            ${inidcated} =    Set Variable    ${element}
            ${sum_of_price_from_table} =    Evaluate    ${sum_of_price_from_table}+${inidcated}
        END

        Set Global Variable    ${sum_of_price_from_table}

Get Number Of Heroes

    ${number_of_users} =    Helpfunction.get_number_of_users

    Set Global Variable    ${number_of_users}

Count Rows In Table
    
    ${initial_rows}=    SeleniumLibrary.Get Element Count    xpath://*[@id="contents"]/div[2]/table/tbody/tr
    
    Set Global Variable    ${initial_rows}

Get Initial Financial Relief Summary Statement

        Wait Until Element Is Visible     xpath://*[@id="contents"]/div[2]/div/p
        ${relief_statement} =    Get Text    xpath://*[@id="contents"]/div[2]/div/p

        Set Global Variable    ${relief_statement}


Get Subsequent Financial Relief Summary Statement

        Wait Until Element Is Visible     xpath://*[@id="contents"]/div[3]/div/p
        ${relief_statement} =    Get Text    xpath://*[@id="contents"]/div[3]/div/p

        Set Global Variable    ${relief_statement}

Get Financial Summary For Number Of Heroes From Api

        ${api_relief_summary_heroes} =    Helpfunction.curl_get_relief_summary_users

        Set Global Variable    ${api_relief_summary_heroes}


Get Financial Summary For Total Relief From Api

        ${api_relief_summary_total_relief} =    Helpfunction.Curl Get Relief Summary Relief

        Set Global Variable    ${api_relief_summary_total_relief}


Get Database Rounded Sum Of Relief

    ${total_database_relief}=    Helpfunction.get_total_relief
    ${rounded_total_database_relief} =    Helpfunction.round_to_2_dp  ${total_database_relief}

    Set Global Variable    ${rounded_total_database_relief}

Click On Refresh Tax Relief Table Button
    Click Element    xpath://*[@id="contents"]/button[1]