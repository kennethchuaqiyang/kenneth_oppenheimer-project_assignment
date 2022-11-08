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
Verify Ability To Retrieve One Hero With Zero Relief Upon Entry And Refresh Tax Relief Table Button
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    @{nat_id_list}=    Helpfunction.create_single_zero_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Click On Refresh Tax Relief Table Button
    Check NatIds Exist in Table

    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0
    Log To Console    dfnksalfndalsfndaslkvndasklfndlafnalskdfn

    Get Hero Relief From Table

    ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}
    IF    ${hero_relief_from_databaase} != ${hero_relief_from_table}
        Fail
    END
    Reload Page
Verify Summary Statement Will Be Zero When Previous Sum Is Zero And Added One Hero With Zero Relief After Refresh Tax Button
     [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    ${current_total_sum}=    HelpFunction.curl_get_relief_summary_relief
    IF    ${current_total_sum} != 0
        Skip
    END
    @{nat_id_list}=    Helpfunction.create_single_zero_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Click On Refresh Tax Relief Table Button
    Sleep    2s
    Check NatIds Exist in Table

    Get Subsequent Financial Relief Summary Statement     

        
    ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  £0
    IF    ${check_against_price} 
        Pass Execution    Sub Price Sub Test Passed
    ELSE
        Fail
    END
    Reload Page


 

 
 