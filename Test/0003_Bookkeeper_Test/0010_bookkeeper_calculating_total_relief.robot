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

Verify Bookkeeper Can Match Total From DB Table and Summary Statement Matches Before Adding Any New Heroes

    [Documentation]  This test Case is to ensure Bookkeepr can ensure that the sum from DB and Summary Statement Matches
    [Tags]  Bookkeeper    Sum of Relief    Statement Relief    API Sum

    Click On Refresh Tax Relief Table Button
    Sleep    2s
    Get Number Of Heroes
    Get Database Rounded Sum Of Relief
    Calculate Total Price From Table
    Get Subsequent Financial Relief Summary Statement

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
 
    [Documentation]  This test Case is to ensure Bookkeepr can ensure that the sum from DB and Summary Statement will not increase when there is an unsucessful update of any hero
    [Tags]  Bookkeeper    Sum of Relief    No Update In Sum    Unsuccessful Update

    Get Subsequent Financial Relief Summary Statement
    
    Click On Refresh Tax Relief Table Button
    Sleep    2s
    Get Number Of Heroes
    Get Database Rounded Sum Of Relief
    Calculate Total Price From Table
    Get Subsequent Financial Relief Summary Statement
    
    ${initial_statement_relief} =    Helpfunction.obtainpricefromstatement    ${relief_statement}
    
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
    ${round_difference} =    Helpfunction.round_to_2_dp    ${difference}

    IF    ${round_difference} != ${0.00}

        Fail

    END

    Reload Page


Verify Bookkeeper Can Match Total From DB Table and Summary Statement Matches After Adding 1 Heroes
     
    [Documentation]  This test Case is to ensure Bookkeepr can ensure that the sum from DB and Summary Statement will increase when there is an successful addition of one hero
    [Tags]  Bookkeeper    Sum of Relief    Update In Sum    Successful Update    One Hero

    Get Subsequent Financial Relief Summary Statement
    
    Click On Refresh Tax Relief Table Button
    Sleep    2s

    Get Number Of Heroes
    Get Database Rounded Sum Of Relief
    Calculate Total Price From Table
    Get Subsequent Financial Relief Summary Statement
    
    ${initial_statement_relief} =    Helpfunction.obtainpricefromstatement    ${relief_statement}
    
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
    ${round_difference} =    Helpfunction.round_to_2_dp    ${difference}

    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0

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

    [Documentation]  This test Case is to ensure Bookkeepr can ensure that the sum from DB and Summary Statement will increase when there is an successful addition of more than one hero
    [Tags]  Bookkeeper    Sum of Relief    Update In Sum    Successful Update    More Than One Hero

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
    ${round_difference} =    Helpfunction.round_to_2_dp    ${difference}
    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0
    Calculate Specific Heroes Relief From Database

    ${round_total_db_calculation} =    Helpfunction.round_to_2_dp    ${total_db_calculation}

    Calculate Specific Heroes Hero Relieft From Table
    ${round_total_table_calculation} =    Helpfunction.round_to_2_dp    ${total_hero_relief_calculation}
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