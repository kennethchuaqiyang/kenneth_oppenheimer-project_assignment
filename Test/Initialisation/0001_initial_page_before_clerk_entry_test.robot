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
Verify Initial Text of Summary Table Of The Oppenheimer Project
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    
    Get Number Of Heroes

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
         Count Rows In Table

            IF    ${initial_rows} != ${number_of_users}
        
                Fail
        
            ELSE

            Pass Execution    Test Passed
        
            END

     END   


Verify Initial Text of Summary Relief Text Of The Oppenheimer Project Corresponds To Data From API Call
    [Documentation]  This test case verifies the initial relief summary text for The Oppenheimer Project
    [Tags]  Initial

    Get Number Of Heroes

    # ${init_relief_statement} =    Helpfunction.curl_get_relief_summary_users
    Get Financial Summary For Number Of Heroes From Api
    Get Financial Summary For Total Relief From Api


     IF    ${number_of_users} == ${0}

        Get Initial Financial Relief Summary Statement

        ${check_against_people} =    Helpfunction.splittextforpeople  ${relief_statement}  ${api_relief_summary_heroes}
        IF    ${check_against_people} == ${False} 
            Fail            
        END

        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${api_relief_summary_total_relief}
        IF    ${check_against_price} 
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END

     ELSE
        Get Subsequent Financial Relief Summary Statement     
        
        ${check_against_people} =    Helpfunction.splittextforpeople  ${relief_statement}  ${api_relief_summary_heroes}
        IF    ${check_against_people} == ${False} 
            Fail            
        END
        
        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${api_relief_summary_total_relief}
        IF    ${check_against_price} 
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END
     END

Verify Initial Text of Summary Relief Statement Of The Oppenheimer Project Corresponds To Front End Table
    [Documentation]  This test case verifies the initial relief summary text for The Oppenheimer Project
    [Tags]  Initial
    
    Get Number Of Heroes

     IF    ${number_of_users} == ${0}

        Get Initial Financial Relief Summary Statement
        
        ${check_against_people} =    Helpfunction.splittextforpeople  ${relief_statement}  ${0}
        IF    ${check_against_people} == ${False} 
            Fail            
        END

        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${0}
        IF    ${check_against_price} == ${True}
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END

    ELSE

        Get Subsequent Financial Relief Summary Statement     
        Count Rows In Table

        ${check_against_people} =    Helpfunction.splittextforpeople  ${relief_statement}  ${initial_rows}
        IF    ${check_against_people} == ${False} 
            Fail            
        END
        
        Calculate Total Price From Table

        ${rounded_price_from_table} =    Helpfunction.round_to_2_dp  ${sum_of_price_from_table}

        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${rounded_price_from_table}
        
        Log To Console    check against price
        Log To Console    ${rounded_price_from_table}
        Log To Console    ${check_against_price}
        IF    ${check_against_price} 
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END

     END

    
Verify Initial Sum of Relief From Database Of The Oppenheimer Project Corresponds To Front End Table
    [Documentation]  This test case verifies the initial relief summary text for The Oppenheimer Project
    [Tags]  Initial
    
    Get Number Of Heroes
    Get Database Rounded Sum Of Relief

     IF    ${number_of_users} == ${0}

        Skip

    ELSE

        Get Subsequent Financial Relief Summary Statement     
        Count Rows In Table
        
        Calculate Total Price From Table

        ${rounded_price_from_table} =    Helpfunction.round_to_2_dp  ${sum_of_price_from_table}

        IF    ${rounded_total_database_relief} == ${rounded_price_from_table}
        Pass Execution    Pass as database corresponds to summary front end total
        ELSE
        Fail
        END

     END

    