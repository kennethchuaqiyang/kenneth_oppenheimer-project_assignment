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

Verify Bookkeeper Not Able To Retrieve Invalid Entry of Heroes For Calculation

   [Documentation]  This test ensure when an invalid hero is added, it should not be displayed on the table or added to the database for calulation of relief
    [Tags]  Bookkeeper    No Relief Calculation    No Table Update 
    
    Set Initial Number Of Heroes
    
    ${national_id}=    Helpfunction.create_hero_for_invalid_entry_no_relief_calculation
    Set Global Variable    ${nat_id_list}
    ${response} =    Helpfunction.post_file_api    ${UploadFile}

    ${hero_relief_from_database} =    Helpfunction.get_user_relief  ${national_id}

    IF    ${hero_relief_from_database} != ${-1}

        Fail

    END

Verify Bookkeeper Able To Retrieve Heroes Where Salary Is More Than Tax After Clicking Refresh Button For Calculation And Display Of Relief

   [Documentation]  This test ensure relief can be calculated and table will show when a hero with salary more than tax is added
    [Tags]  Bookkeeper    Calculation Relief    Update on Table    Salary>Tax

    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Click On Refresh Tax Relief Table Button
    Check NatIds Exist in Table

    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0

    Get Hero Relief From Table

    ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}

    IF    ${hero_relief_from_databaase} != ${hero_relief_from_table}

        Fail

    END

    Reload Page


Verify Bookkeeper Able To Retrieve Heroes Where Tax Is More Than Salary After Clicking Refresh Button For Calculation And Display Of Relief
   [Documentation]  This test ensure relief can be calculated and table will show when a hero with salary less than tax is added
    [Tags]  Bookkeeper    Calculation Relief    Update on Table    Salary<Tax

    @{nat_id_list}=    Helpfunction.create_single_full_details_higher_tax_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Click On Refresh Tax Relief Table Button
    Check NatIds Exist in Table

    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0

    Get Hero Relief From Table

    ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}
    IF    ${hero_relief_from_databaase} != ${hero_relief_from_table}
        Fail
    END
    Reload Page

Verify Bookkeeper Able To Retrieve Heroes Where Tax Is Equal Salary After Clicking Refresh Button For Calculation And Display Of Relief
   [Documentation]  This test ensure relief can be calculated and table will show when a hero with salary Equal to tax is added
    [Tags]  Bookkeeper    Calculation Relief    Update on Table    Salary equal to Tax

    @{nat_id_list}=    Helpfunction.create_single_full_details_equal_tax_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Click On Refresh Tax Relief Table Button
    Check NatIds Exist in Table

    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0

    Get Hero Relief From Table

    ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}

    IF    ${hero_relief_from_databaase} != ${hero_relief_from_table}

        Fail

    END
    
    Reload Page


Verify Bookkeeper Able To Retrieve More Than 1 Hero After Clicking Refresh Button To Calculate And Display Individual Relief

   [Documentation]  This test ensure relief can be calculated and table will show when more than one hero is added
    [Tags]  Bookkeeper    Calculation Relief    Update on Table    More than one people

    @{nat_id_list}=    Helpfunction.create_two_full_random_details_requirement_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE
     Sleep    2s     
    
    Click On Refresh Tax Relief Table Button
    Check NatIds Exist in Table

    Set Subsequent Number Of Heroes
    ${hero_relief_from_table}    Set Variable    0

    FOR    ${nat_id}    IN    @{nat_id_list}

            ${hero_relief_from_table}    Set Variable    0
            ${national_id}    Set Variable    ${nat_id}
            Set Global Variable    ${national_id}
            Get Hero Relief From Table

            ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}

            IF    ${hero_relief_from_databaase} != ${hero_relief_from_table}

            Fail
            
            END

    END

    Reload Page