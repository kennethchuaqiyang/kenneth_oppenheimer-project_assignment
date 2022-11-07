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
Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender M Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_big_M_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender M Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_big_M_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table   

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender f Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_small_f_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender f Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_small_f_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table   

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender F Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_big_F_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender F Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_big_F_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table  

Verify Clerk Can Upload Of One Hero With Valid Birthday No Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    Skip
    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_no_gender_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday No Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    Skip
    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_no_gender_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table  


Verify Clerk Can Upload Of One Hero With Valid Birthday Chinese Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_chinese_gender_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Chinese Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_chinese_gender_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table  

#To edit jumbled since it is valid
#valid will be chinese character, alphanumeric for name and id, id more than 4 char, upper lower M/F, 

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Salary Valid Higher Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_higher_tax_requiremenet_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Salary Valid Higher Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_higher_tax_requiremenet_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table


Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_letters_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_letters_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Number Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_numbers_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Number Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_numbers_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table


Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphanumeric Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_alphanumerics_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphanumeric Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_alphanumerics_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Space Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_space_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Space Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_space_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Special Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_specialcharacters_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Special Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_specialcharacters_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table


Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Chinese Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_chinesecharacters_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Chinese Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_chinesecharacters_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table
Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_numbers_id_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_numbers_id_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Alphabet Character NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_letters_id_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Alphabet Character NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_letters_id_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 AlphaNumeric Character NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_alphanumeric_id_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Alphanumeric Character NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_alphanumeric_id_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Character With Space NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_space_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Character With Space NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_space_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Special Character NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_special_character_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Special Character NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_special_character_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Chinese Character NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_chinese_character_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Chinese Character NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_chinese_character_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 9 Alphanumeric Character NatId Valid Higher Salary Valid Tax Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_9_alphanumeric_id_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    Check NatIds Exist in Table

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 9 Alphanumeric Character NatId Valid Higher Salary Valid Tax Via Api Call
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_9_alphanumeric_id_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column
    Check NatIds Exist in Table


#TBC: NATid variation, Jumble, multiple (2 and many)
Verify Clerk Can Process valid Upload Csv File With Jumbled Column Via FrontEnd
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_jumbled_column_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    Set Global Variable    ${filename}
    Sending Files Through FE

    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    
    Check NatIds Exist in Table

#To edit jumbled since it is valid

Verify Clerk Can Process Valid Upload CSV With Jumbled Column Via API Call Causing 500 Error Code
    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    
    # Open Website The Oppenheimer Project
    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_jumbled_column_csv
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END
    #Check for column

    Check NatIds Exist in Table


Verify Clerk Can Process Mass Entry Of 50 Heroes With Valid Entries

    [Documentation]  This test case verifies the initial settings for the table for The Oppenheimer Project
    [Tags]  Initial
    # Open Website The Oppenheimer Project

    # Get Number Of Heroes
    # ${initial_number_of_heroes}    Set Variable    ${number_of_users}
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_mass_full_details_requirement_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END
    #check eventual number
    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes


    #should not be the same
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${50}
        Fail
    END
    #Check for column
    # Check NatIds Exist in Table