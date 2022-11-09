*** Settings ***
Documentation    Test Clerk Able To Upload Heroes Under Certain Condition For Oppenheimer Project
Library    SeleniumLibrary
Library    XML
Library    ../../Helper_Functions/Helpfunction.py
Library    Collections
Resource    ../../Resources/resources.robot    


*** Variables ***
${initial_rows}
${init_text}

*** Test Cases ***

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for gender m using small caps using FE file upload.
    [Tags]  Clerk Valid Upload    Gender    Small caps    m    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}
    
        Fail
    
    END
    
    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call
    
    [Documentation]  This test case verifies clerk can upload heroes for gender m using small caps using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Gender    Small caps    m    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
    
        Fail
    
    END

    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender M Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for gender M using big caps using FE file upload.
    [Tags]  Clerk Valid Upload    Gender    Big caps    M    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_big_M_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    
    IF    ${difference} != ${1}

        Fail
    
    END
    
    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender M Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender M Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for gender m using big caps using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Gender    Big caps    M    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_big_M_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s        
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table   
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender M Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender f Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for gender f using small caps using FE file upload.
    [Tags]  Clerk Valid Upload    Gender    small caps    f    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_small_f_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender f Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender f Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for gender f using small caps using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Gender    small caps    f    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_small_f_csv

    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table   
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender f Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender F Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for gender f using big caps using FE file upload.
    [Tags]  Clerk Valid Upload    Gender    big caps    f    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_big_F_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}   

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender F Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender F Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for gender F using big caps using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Gender    big caps    F    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_big_F_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table  
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Big Cap Gender F Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday No Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for no gender using FE file upload. It is skipped as it causes the server the crash for some reason.
    [Tags]  Clerk Valid Upload    No Gender    FE file upload    To Be Reported
    
    #skip as it crashes the server and caused other test case to hang
    Log    To be reported as a crash case
    Skip

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_no_gender_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday No Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday No Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for no gender using API uploadLargeFileForInsertionToDatabase. It is skipped as it causes the server the crash for some reason.
    [Tags]  Clerk Valid Upload    No Gender    FE file upload    To Be Reported    uploadLargeFileForInsertionToDatabase
    
    #skip as it crashes the server and caused other test case to hang
    Log    To be reported as a crash case
    Skip

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_no_gender_csv
    Set Global Variable    @{nat_id_list}


    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table  
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday No Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Chinese Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for gender using chinese character using FE file upload.
    [Tags]  Clerk Valid Upload    Gender    Chinese character    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_chinese_gender_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Chinese Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Chinese Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for gender F using big caps using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Gender    Chinese character    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_requiremenet_chinese_gender_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END

    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    IF    ${difference} != ${1}
        Fail
    END

    Check NatIds Exist in Table  
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Chinese Gender Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Salary Valid Higher Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for higher tax than salary using FE file upload.
    [Tags]  Clerk Valid Upload    Higher Tax    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_higher_tax_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}
 
        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Salary Valid Higher Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Salary Valid Higher Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for higher tax using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Higher tax    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_single_full_details_higher_tax_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Salary Valid Higher Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for alphabetical name using FE file upload.
    [Tags]  Clerk Valid Upload    Name    Alphabet    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_letters_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    
    Set Global Variable    ${filename}
    
    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}
    
        Fail
    
    END
    
    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for alphabetical name using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Name    Alphabet    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_letters_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphabet Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Number Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for numerical name using FE file upload.
    [Tags]  Clerk Valid Upload    Numerical    Name    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_numbers_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Number Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Number Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for numerical name using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Numerical    Name    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_numbers_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Number Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphanumeric Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for alphanumeric name using FE file upload.
    [Tags]  Clerk Valid Upload    Alphanumeric    Name    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_alphanumerics_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}  

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphanumeric Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphanumeric Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for alphanumeric name using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    AlphaNumeric    Name    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_alphanumerics_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail
    
    END

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Alphanumeric Name Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Space Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for spaced name using FE file upload.
    [Tags]  Clerk Valid Upload    Spaced    Name    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_space_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Space Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Space Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for spaced name using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Spaced    Name    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_space_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Space Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Special Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for special character name using FE file upload.
    [Tags]  Clerk Valid Upload    Special Character    Name    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_specialcharacters_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Special Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Special Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for special character name using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Special Character    Name    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_specialcharacters_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page
    
    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Special Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Chinese Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for chinese character name using FE file upload.
    [Tags]  Clerk Valid Upload    Chinese Character    Name    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_chinesecharacters_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Chinese Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Chinese Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for chinese character name using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Chinese Character    Name    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_name_with_chinesecharacters_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name With Chinese Character Valid Normal Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for 4 numerical national id using FE file upload.
    [Tags]  Clerk Valid Upload    Length 4    Numerical    National id    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_numbers_id_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for 4 numerical national id using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Length 4    Numerical    National id    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_numbers_id_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full Numerical 4 Digit NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Alphabet Character NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for 4 alphabetical national id using FE file upload.
    [Tags]  Clerk Valid Upload    Length 4    Alphabetical    National id    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_letters_id_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Alphabet Character NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Alphabet Character NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for 4 alphabetical national id using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Length 4    Alphabetical    National id    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_letters_id_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Alphabet Character NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 AlphaNumeric Character NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for 4 alphanumeric national id using FE file upload.
    [Tags]  Clerk Valid Upload    Length 4    AlphaNumeric    National id    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_alphanumeric_id_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 AlphaNumeric Character NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Alphanumeric Character NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for 4 alphanumeric national id using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Length 4    AlphaNumeric    National id    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_alphanumeric_id_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Alphanumeric Character NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Character With Space NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for 4 spaced national id using FE file upload.
    [Tags]  Clerk Valid Upload    Length 4    Spaced    National id    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_space_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page
    
    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Character With Space NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Character With Space NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for 4 spaced national id using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Length 4    Spaced    National id    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_space_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Character With Space NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Special Character NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for 4 special character national id using FE file upload.
    [Tags]  Clerk Valid Upload    Length 4    Special Character    National id    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_special_character_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}   

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Special Character NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Special Character NatId Valid Higher Salary Valid Tax Via Api Call
 
    [Documentation]  This test case verifies clerk can upload heroes for 4 special character national id using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Length 4    Special Character    National id    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_special_character_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Special Character NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Chinese Character NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for 4 chinese character national id using FE file upload.
    [Tags]  Clerk Valid Upload    Length 4    Chinese Character    National id    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_chinese_character_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Chinese Character NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Chinese Character NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for 4 chinese character national id using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Length 4    Chinese Character    National id    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_4_id_with_chinese_character_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 4 Chinese Character NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 9 Alphanumeric Character NatId Valid Higher Salary Valid Tax Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes for 9 alphanumeric character national id using FE file upload.
    [Tags]  Clerk Valid Upload    Length 9    AlphaNumeric    National id    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_9_alphanumeric_id_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 9 Alphanumeric Character NatId Valid Higher Salary Valid Tax Via FrontEnd

Verify Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 9 Alphanumeric Character NatId Valid Higher Salary Valid Tax Via Api Call

    [Documentation]  This test case verifies clerk can upload heroes for 9 alphanumeric character national id using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Length 9    AlphaNumeric    National id    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_id_with_9_alphanumeric_id_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of One Hero With Valid Birthday Valid Small Cap Gender m Valid Normal Full Name Valid Normal Full 9 Alphanumeric Character NatId Valid Higher Salary Valid Tax Via Api Call

Verify Clerk Can Process valid Upload Csv File With Jumbled Column Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes with a jumbled columns csv with valid data using FE file upload.
    [Tags]  Clerk Valid Upload    Jumbled column    FE file upload
    
    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_jumbled_column_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    
    Set Global Variable    ${filename}
    
    Sending Files Through FE

    
    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END
    
    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Process valid Upload Csv File With Jumbled Column Via FrontEnd

Verify Clerk Can Process Valid Upload CSV With Jumbled Column Via API Call

    [Documentation]  This test case verifies clerk can upload heroes with a jumbled columns csv with valid data using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Jumbled Column    API call    uploadLargeFileForInsertionToDatabase
    
    Set Initial Number Of Heroes    
    @{nat_id_list}=    Helpfunction.create_jumbled_column_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}
        Fail
    END

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Process Valid Upload CSV With Jumbled Column Via API Call

Verify Clerk Can Process Mass Entry Of 50 Heroes With Valid Entries

    [Documentation]  This test case verifies clerk can upload 50 valid heroes.
    [Tags]  Clerk Valid Upload    Mass Upload    50 heroes    FE file upload


    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_mass_full_details_requirement_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${50}

        Fail

    END
    Pass Execution    Verify Clerk Can Process Mass Entry Of 50 Heroes With Valid Entries

Verify Clerk Can Process Valid Upload Of Zero Hero Via FrontEnd

    [Documentation]  This test case verifies clerk can upload csv with no heroes using FE file upload.
    [Tags]  Clerk Valid Upload    No heroes    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_zero_hero_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}   

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Fail

    END
    Pass Execution    Verified Clerk Can Process Valid Upload Of Zero Hero Via FrontEnd

Verify Clerk Can Process valid Upload Of Zero Hero Via API Call

    [Documentation]  This test case verifies clerk can upload csv with no heroes using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk valid Upload    No heroes    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_zero_hero_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}

    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Fail

    END
    Pass Execution    Verified Clerk Can Process valid Upload Of Zero Hero Via API Call

Verify Clerk Cann Process Empty Csv Via FrontEnd

    [Documentation]  This test case verifies clerk can upload empty csv using FE file upload.
    [Tags]  Clerk Valid Upload    Empty Csv    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_empty_csv
    
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    
    
    Set Global Variable    ${filename}
    
    Sending Files Through FE

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Fail

    END
    Pass Execution    Verified Clerk Cann Process Empty Csv Via FrontEnd

Verify Clerk Can Process Empty Csv Via API Call

    [Documentation]  This test case verifies clerk can upload empty csv using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk valid Upload    Empty CSV    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_empty_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}

    ${check_response} =    Helpfunction.check_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Fail

    END
    Pass Execution    Verify Clerk Can Process Empty Csv Via API Call