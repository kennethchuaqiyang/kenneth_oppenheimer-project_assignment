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
Verify Initial Database Total Relief Of The Oppenheimer Project Corresponds To Relief From API Summary Call
    [Documentation]  This test case verifies the initial relief summary text for The Oppenheimer Project
    [Tags]  Initial

    Get Number Of Heroes
    Get Financial Summary For Number Of Heroes From Api
    Get Financial Summary For Total Relief From Api
    Get Database Rounded Sum Of Relief

    IF    ${rounded_total_database_relief} == ${api_relief_summary_total_relief}
        Pass Execution    Pass as database corresponds to summary api call
    ELSE
        Fail
    END


Verify Initial Text of Summary Relief Text Of The Oppenheimer Project Corresponds To Sum From Database
    [Documentation]  This test case verifies the initial relief summary text for The Oppenheimer Project
    [Tags]  Initial

    Get Number Of Heroes

    Get Database Rounded Sum Of Relief



     IF    ${number_of_users} == ${0}

        Get Initial Financial Relief Summary Statement
        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${rounded_total_database_relief}

        IF    ${check_against_price} 
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END

     ELSE
        Get Subsequent Financial Relief Summary Statement     

        
        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${rounded_total_database_relief}
        IF    ${check_against_price} 
            Pass Execution    Sub Price Sub Test Passed
        ELSE
            Fail
        END
     END


Verify Initial Text of Summary Table Of The Oppenheimer Project Does Not Change When No Additional CSV Is Added And Refresh Relief Table Is Clicked
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    
    Get Number Of Heroes

     IF    ${number_of_users} == ${0}
         
        Click On Refresh Tax Relief Table Button
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
     
        Click On Refresh Tax Relief Table Button
         Page Should Contain Element    xpath://*[@id="contents"]/div[2]/table
         Page Should Not Contain Element    xpath://*[@id="contents"]/h1
         Count Rows In Table

            IF    ${initial_rows} != ${number_of_users}
        
                Fail
        
            ELSE

            Pass Execution    Test Passed
        
            END

     END   