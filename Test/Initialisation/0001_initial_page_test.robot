*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary
Library    XML
Library  ../Functest.py
Library  ../../Helpfunction.py
Library    Collections


*** Variables ***

*** Test Cases ***
Verify Initial Text of Summary Table Of The Oppenheimer Project
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    
    ${number_of_users} =    Helpfunction.get_number_of_users

     IF    ${number_of_users} == ${0}
     
        Wait Until Element Is Visible     xpath://*[@id="contents"]/h1
        ${init_text} =    Get Text    xpath://*[@id="contents"]/h1
        ${result} =    Helpfunction.check_init_text  ${init_text}
        Log To Console    ${result}
        IF    ${result}
            Page Should Not Contain Element    xpath://*[@id="contents"]/div[2]/table
            Log To Console    PASS
        ELSE
            Fail
        END

     ELSE
     
         Log To Console    {"Someone is home"}
         Page Should Contain Element    xpath://*[@id="contents"]/div[2]/table
        Page Should Not Contain Element    xpath://*[@id="contents"]/h1

        ${initial_rows}=    SeleniumLibrary.Get Element Count    xpath://*[@id="contents"]/div[2]/table/tbody/tr
        
        IF    ${initial_rows} != ${number_of_users}
        
            Fail
        
        ELSE

            Pass Execution    Test Passed
        
        END

     END   


Verify Initial Text of Summary Relief Text Of The Oppenheimer Project From API Call
    [Documentation]  This test case verifies the initial relief summary text for The Oppenheimer Project
    [Tags]  Initial
     ${number_of_users} =    Helpfunction.get_number_of_users

    ${init_relief_statement} =    Helpfunction.curl_get_relief_summary_users

    Log To Console    ${number_of_users}

     IF    ${number_of_users} == ${0}
     
        
        Log To Console    ${init_relief_statement}

        ${check_against_people} =    Helpfunction.splittextforpeople  ${init_relief_statement}  ${0}
        IF    ${check_against_people} == ${False} 
            Fail            
        END

        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${init_relief_statement}  ${0}
        IF    ${check_against_price} 
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END

     ELSE
     
        Wait Until Element Is Visible     xpath://*[@id="contents"]/div[3]/div/p
        ${init_relief_statement} =    Get Text    xpath://*[@id="contents"]/div[3]/div/p
        
        ${init_table}=    SeleniumLibrary.Get Element Count    xpath://*[@id="contents"]/div[2]/table/tbody/tr

        ${check_against_people} =    Helpfunction.splittextforpeople  ${init_relief_statement}  ${init_table}
        IF    ${check_against_people} == ${False} 
            Fail            
        END

        @{PriceList}=    Create List

        FOR    ${index}    IN RANGE    1    ${init_table}+1

            ${var} =    Get Text    xpath://*[@id="contents"]/div[2]/table/tbody/tr[${index}]/td[2]
            Append To List    ${PriceList}    ${var}    
        END
        ${sum_of_price} =    Set Variable    ${0.00}
        FOR    ${element}    IN    @{PriceList}

            ${inidcated} =    Set Variable    ${element}
            ${sum_of_price} =    Evaluate    ${sum_of_price}+${inidcated}
        END

        ${test_round} =    Helpfunction.round_to_2_dp  ${sum_of_price}

        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${init_relief_statement}  ${test_round}
        IF    ${check_against_price} 
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END

     END

    
 






Verify Initial Text of Summary Relief Text Of The Oppenheimer Project From Front End
    [Documentation]  This test case verifies the initial relief summary text for The Oppenheimer Project
    [Tags]  Initial
    
    ${number_of_users} =    Helpfunction.get_number_of_users

     IF    ${number_of_users} == ${0}
     
        Wait Until Element Is Visible     xpath://*[@id="contents"]/div[2]/div/p
        ${init_relief_statement} =    Get Text    xpath://*[@id="contents"]/div[2]/div/p
        
        Log To Console    ${init_relief_statement}

        ${check_against_people} =    Helpfunction.splittextforpeople  ${init_relief_statement}  ${0}
        IF    ${check_against_people} == ${False} 
            Fail            
        END

        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${init_relief_statement}  ${0}
        IF    ${check_against_price} 
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END

     ELSE
     
        Wait Until Element Is Visible     xpath://*[@id="contents"]/div[3]/div/p
        ${init_relief_statement} =    Get Text    xpath://*[@id="contents"]/div[3]/div/p
        
        ${init_table}=    SeleniumLibrary.Get Element Count    xpath://*[@id="contents"]/div[2]/table/tbody/tr

        ${check_against_people} =    Helpfunction.splittextforpeople  ${init_relief_statement}  ${init_table}
        IF    ${check_against_people} == ${False} 
            Fail            
        END

        @{PriceList}=    Create List

        FOR    ${index}    IN RANGE    1    ${init_table}+1

            ${var} =    Get Text    xpath://*[@id="contents"]/div[2]/table/tbody/tr[${index}]/td[2]
            Append To List    ${PriceList}    ${var}    
        END
        ${sum_of_price} =    Set Variable    ${0.00}
        FOR    ${element}    IN    @{PriceList}

            ${inidcated} =    Set Variable    ${element}
            ${sum_of_price} =    Evaluate    ${sum_of_price}+${inidcated}
        END

        ${test_round} =    Helpfunction.round_to_2_dp  ${sum_of_price}

        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${init_relief_statement}  ${test_round}
        IF    ${check_against_price} 
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END

     END

    
 