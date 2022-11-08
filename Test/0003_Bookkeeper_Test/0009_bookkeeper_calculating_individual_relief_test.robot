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
#Add invalid case, salary more than tax, tax more than salary, multiple cases
Verify Bookkeeper Not Able To Retrieve Invalid Entry of Heroes For Calculation
   [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    ${national_id}=    Helpfunction.create_hero_for_invalid_entry_no_relief_calculation
    Set Global Variable    ${nat_id_list}
    ${response} =    Helpfunction.post_file_api    ${UploadFile}



    ${hero_relief_from_database} =    Helpfunction.get_user_relief  ${national_id}
    Log To Console    testtestestestest
    Log To Console    ${hero_relief_from_database}
    IF    ${hero_relief_from_database} != ${-1}
        Fail
    END
    # ${response} =    Helpfunction.post_file_api    ${UploadFile}
    # ${check_response} =    Helpfunction.check_success_response    ${response}

    # ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    # ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    # IF    ${check_response} == ${False}
    #     Fail
    # END
    # #check eventual number
    # Sleep    2s     
    
    # Reload Page
    # Set Subsequent Number Of Heroes


    # #should not be the same
    # ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    # IF    ${difference} != ${0}
    #     Fail
    # END
    # #Check for column
    # ${national_id}    Set Variable    9997
    # Set Global Variable    ${national_id}
    # Check For Non Valid Not Added National ID

Verify Bookkeeper Able To Retrieve Heroes Where Salary Is More Than Tax After Clicking Refresh Button For Calculation And Display Of Relief
   [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

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
    Log To Console    dfnksalfndalsfndaslkvndasklfndlafnalskdfn

    Get Hero Relief From Table

    ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}
    IF    ${hero_relief_from_databaase} != ${hero_relief_from_table}
        Fail
    END
    Reload Page


Verify Bookkeeper Able To Retrieve Heroes Where Tax Is More Than Salary After Clicking Refresh Button For Calculation And Display Of Relief
   [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

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
    Log To Console    dfnksalfndalsfndaslkvndasklfndlafnalskdfn

    Get Hero Relief From Table

    ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}
    IF    ${hero_relief_from_databaase} != ${hero_relief_from_table}
        Fail
    END
    Reload Page

Verify Bookkeeper Able To Retrieve More Than 1 Hero After Clicking Refresh Button To Calculate And Display Individual Relief
   [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

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
    Log To Console    dfnksalfndalsfndaslkvndasklfndlafnalskdfn
    FOR    ${nat_id}    IN    @{nat_id_list}
            ${hero_relief_from_table}    Set Variable    0
            Log To Console    dfnksalfndalsfndaslkvndasklfndlafnalskdfn
            ${national_id}    Set Variable    ${nat_id}
            Set Global Variable    ${national_id}
            Get Hero Relief From Table

            ${hero_relief_from_databaase} =    Helpfunction.get_user_relief  ${national_id}
            IF    ${hero_relief_from_databaase} != ${hero_relief_from_table}
            Fail
            END

    END
    Reload Page