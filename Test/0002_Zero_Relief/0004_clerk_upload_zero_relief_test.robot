*** Settings ***
Documentation    Test Clerk Can Upload Zero Relief Heroes For Oppenheimer Project
Library    SeleniumLibrary
Library    XML
Library    ../../Helper_Functions/Helpfunction.py
Library    Collections
Resource    ../../Resources/resources.robot    


*** Variables ***
${initial_rows}
${init_text}

*** Test Cases ***

Verify Clerk Can Upload Of One Hero With Zero Relief By Setting Tax And Salary To Zero Via FrontEnd

    [Documentation]  This test case verifies clerk can upload one hero with zero relief using FE file upload.
    [Tags]  Clerk Valid Upload    Zero Relief    Single Hero    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_single_zero_requiremenet_csv

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
    Pass Execution    Verified Clerk Can Upload Of One Hero With Zero Relief By Setting Tax And Salary To Zero Via FrontEnd


Verify Clerk Can Upload Of One Hero With Zero Relief By Setting Tax And Salary To Zero Via API call
    
    [Documentation]  This test case verifies clerk can upload one hero with zero relief using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Zero Relief    Single Hero    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_single_zero_requiremenet_csv

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
    Pass Execution    Verified Clerk Can Upload Of One Hero With Zero Relief By Setting Tax And Salary To Zero Via API call


Verify Clerk Can Upload Of Two Heroes With Zero Relief By Setting Tax And Salary To Zero Via FrontEnd

    [Documentation]  This test case verifies clerk can upload heroes with zero relief using FE file upload.
    [Tags]  Clerk Valid Upload    Zero Relief    More than one hero    FE file upload

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_two_zero_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${2}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of Two Heroes With Zero Relief By Setting Tax And Salary To Zero Via FrontEnd


Verify Clerk Can Upload Of Two Heroes With Zero Relief By Setting Tax And Salary To Zero Via API call
    
    [Documentation]  This test case verifies clerk can upload heroes with zero relief using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk Valid Upload    Zero Relief    More than one Hero    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_two_zero_requiremenet_csv

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

    IF    ${difference} != ${2}

        Fail

    END

    Check NatIds Exist in Table
    Pass Execution    Verified Clerk Can Upload Of Two Heroes With Zero Relief By Setting Tax And Salary To Zero Via API call
