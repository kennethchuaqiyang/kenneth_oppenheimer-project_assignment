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
#Add initial case, invalid case, salary more than tax, tax more than salary, multiple cases
Verify Bookkeeper Can Match Total From DB Table and Summary Statement Matches Before Adding Any New Heroes
    Click On Refresh Tax Relief Table Button
    Sleep    2s
    Get Number Of Heroes
    Get Database Rounded Sum Of Relief
    Calculate Total Price From Table
    Get Subsequent Financial Relief Summary Statement
    Log To Console    jfkldjsfkljflkjksalvndlksnlkdnvlkfadndflksnfkldasnflknadlkfnlk   
    Log To Console    ${rounded_total_database_relief}  
    Log To Console    ${sum_of_price_from_table}
    ${round_sum_of_price_from_table} =    Helpfunction.round_to_2_dp    ${sum_of_price_from_table}

    ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${rounded_total_database_relief}
    IF    ${check_against_price} == ${False}
        Fail
    END
    ${check_against_price} =    Helpfunction.splittextforcheckprice  ${relief_statement}  ${round_sum_of_price_from_table}
    IF    ${check_against_price} == ${False}
        Fail
    END
    Reload Page


Verify Bookkeeper Can Match Total From DB Table and Summary Statement Matches After Unsuccessful In Adding 1 Heroes
    Get Subsequent Financial Relief Summary Statement
    
    Click On Refresh Tax Relief Table Button
    Sleep    2s
    Get Number Of Heroes
    Get Database Rounded Sum Of Relief
    Calculate Total Price From Table
    Get Subsequent Financial Relief Summary Statement
    ${initial_statement_relief} =    Helpfunction.obtainpricefromstatement    ${relief_statement}
    Log To Console    ${initial_statement_relief}

    @{nat_id_list}=    Helpfunction.create_hero_for_invalid_entry_no_relief_calculation
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Click On Refresh Tax Relief Table Button
    Get Subsequent Financial Relief Summary Statement
    ${subsequent_statement_relief} =    Helpfunction.obtainpricefromstatement    ${relief_statement}

    ${difference}    Evaluate    ${subsequent_statement_relief}-${initial_statement_relief}
    Log To Console    difference
    Log To Console    ${difference}
    ${round_difference} =    Helpfunction.round_to_2_dp    ${difference}

    IF    ${round_difference} != ${0.00}
        Fail
    END
    Reload Page


Verify Bookkeeper Can Match Total From DB Table and Summary Statement Matches After Adding 1 Heroes
    Get Subsequent Financial Relief Summary Statement
    
    Click On Refresh Tax Relief Table Button
    Sleep    2s
    Get Number Of Heroes
    Get Database Rounded Sum Of Relief
    Calculate Total Price From Table
    Get Subsequent Financial Relief Summary Statement
    ${initial_statement_relief} =    Helpfunction.obtainpricefromstatement    ${relief_statement}
    Log To Console    Initial Statement Relief
    Log To Console    ${initial_statement_relief}
    Log To Console    jfkldjsfkljflkjksalvndlksnlkdnvlkfadndflksnfkldasnflknadlkfnlk   
    Log To Console    ${rounded_total_database_relief}  
    Log To Console    ${sum_of_price_from_table}

    @{nat_id_list}=    Helpfunction.create_single_full_details_higher_tax_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Click On Refresh Tax Relief Table Button
    Check NatIds Exist in Table
    Get Subsequent Financial Relief Summary Statement
    ${subsequent_statement_relief} =    Helpfunction.obtainpricefromstatement    ${relief_statement}

    ${difference}    Evaluate    ${subsequent_statement_relief}-${initial_statement_relief}
    Log To Console    difference
    Log To Console    ${difference}
    ${round_difference} =    Helpfunction.round_to_2_dp    ${difference}

    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0
    Log To Console    dfnksalfndalsfndaslkvndasklfndlafnalskdfn

    Get Hero Relief From Table
    
    ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}
    IF    ${hero_relief_from_databaase} != ${hero_relief_from_table}
        Fail
    END
    IF    ${round_difference} != ${hero_relief_from_table}
        Fail
    END
    IF    ${hero_relief_from_databaase} != ${round_difference}
        Fail
    END
    Reload Page


Verify Bookkeeper Able To Calculate Sum More Than 1 Hero Added After Clicking Refresh Button Where Db And Table Appendment Sum Matches
   [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    Get Subsequent Financial Relief Summary Statement
    ${initial_statement_relief} =    Helpfunction.obtainpricefromstatement    ${relief_statement}

    @{nat_id_list}=    Helpfunction.create_two_full_random_details_requirement_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Click On Refresh Tax Relief Table Button
    Check NatIds Exist in Table
    Get Subsequent Financial Relief Summary Statement

    ${subsequent_statement_relief} =    Helpfunction.obtainpricefromstatement    ${relief_statement}

    ${difference}    Evaluate    ${subsequent_statement_relief}-${initial_statement_relief}
    Log To Console    difference
    Log To Console    ${difference}
    ${round_difference} =    Helpfunction.round_to_2_dp    ${difference}
    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0
    Log To Console    dfnksalfndalsfndaslkvndasklfndlafnalskdfn
    # ${hero_relief_from_database} =    Helpfunction.get_total_user_relief    @{nat_id_list}
    Calculate Specific Heroes Relief From Database

    ${round_total_db_calculation} =    Helpfunction.round_to_2_dp    ${total_db_calculation}

    Calculate Specific Heroes Hero Relieft From Table
    Log To Console    hero table relief
    Log To Console    ${total_hero_relief_calculation}
    ${round_total_table_calculation} =    Helpfunction.round_to_2_dp    ${total_hero_relief_calculation}
    Log To Console    Debuggin
    Log To Console    ${round_difference}
    Log To Console    ${round_total_table_calculation}
    Log To Console    ${round_total_db_calculation}
    IF    ${round_total_db_calculation} != ${round_total_table_calculation}
         Fail
    END
    IF    ${round_difference} != ${round_total_table_calculation}
         Fail
    END
    IF    ${round_total_db_calculation} != ${round_difference}
         Fail
    END
    Reload Page