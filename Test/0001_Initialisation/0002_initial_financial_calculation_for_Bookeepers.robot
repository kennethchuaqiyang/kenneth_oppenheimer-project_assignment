*** Settings ***
Documentation    Initial Check for Financial Calculation For Tabulation And Correspondence Of Relevant Information For Oppenheimer Project
Library    SeleniumLibrary
Library    XML
Library    ../../Helper_Functions/Helpfunction.py
Library    Collections
Resource    ../../Resources/resources.robot    


*** Variables ***
${initial_rows}
${init_text}

*** Test Cases ***
Verify Bookkeeper Can Correspond initial Database Total Relief Of The Oppenheimer Project To Relief From API Summary Call

    [Documentation]  This test case ensure Bookkeeper total sum in database will corresponds to the relief statmenet api
    [Tags]  Initial    Bookeeper    Sum of relief    Db Total    Api    taxReliefSummary
    
    Helpfunction.rakeDatabase
    
    Get Number Of Heroes
    Get Financial Summary For Number Of Heroes From Api
    Get Financial Summary For Total Relief From Api
    Get Database Rounded Sum Of Relief

    IF    ${rounded_total_database_relief} == ${api_relief_summary_total_relief}

        Pass Execution    Verified Bookkeeper Can Correspond initial Database Total Relief Of The Oppenheimer Project To Relief From API Summary Call


    ELSE

        Fail

    END


Verify Bookeeper Can Correspond Initial Text of Summary Relief Statement Of The Oppenheimer Project To Sum From Database

    [Documentation]  This test case ensure Bookkeeper total sum in database will corresponds to the relief statmenet api
    [Tags]  Initial    Bookeeper    Sum of relief    Db Total    Relief Summary Statement

    Helpfunction.rakeDatabase
    
    Get Number Of Heroes

    Get Database Rounded Sum Of Relief

     IF    ${number_of_users} == ${0}

        Get Initial Financial Relief Summary Statement

        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${rounded_total_database_relief}

        IF    ${check_against_price} 

            Pass Execution    Verified Bookeeper Can Correspond Initial Text of Summary Relief Statement Of The Oppenheimer Project To Sum From Database


        ELSE

            Fail

        END

     ELSE

        Get Subsequent Financial Relief Summary Statement     
        
        ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${rounded_total_database_relief}

        IF    ${check_against_price} 

            Pass Execution    Verified Bookeeper Can Correspond Initial Text of Summary Relief Statement Of The Oppenheimer Project To Sum From Database


        ELSE

            Fail

        END

     END


Verify Bookeeper Can Ensure Initial Text of Summary Table Of The Oppenheimer Project Does Not Change When No Additional CSV Is Added And Refresh Relief Table Is Clicked
    [Documentation]  This test case verifies the initial settings for the relief statement do not change when Tax Relief button is pressed and no additional data is added
    [Tags]  Initial    Bookeeper    No Additional Data    Tax Refresh Button    Relief Summary Statement No Change
    
    Helpfunction.rakeDatabase

    Get Number Of Heroes

     IF    ${number_of_users} == ${0}
         
        Click On Refresh Tax Relief Table Button

        Wait Until Element Is Visible     xpath://*[@id="contents"]/h1

        ${init_text} =    Get Text    xpath://*[@id="contents"]/h1

        ${result} =    Helpfunction.check_init_text  ${init_text}

        IF    ${result}

            Page Should Not Contain Element    xpath://*[@id="contents"]/div[2]/table
            Pass Execution    Verified Bookeeper Can Ensure Initial Text of Summary Table Of The Oppenheimer Project Does Not Change When No Additional CSV Is Added And Refresh Relief Table Is Clicked


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

            Pass Execution    Verified Bookeeper Can Ensure Initial Text of Summary Table Of The Oppenheimer Project Does Not Change When No Additional CSV Is Added And Refresh Relief Table Is Clicked

        
            END

     END   