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

Verify Clerk Cannot Upload Non Existing Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload a non existing file through API call. This is skip because it hangs the testing.
    [Tags]  Clerk Invalid Upload    Non Existing Csv    API call    uploadLargeFileForInsertionToDatabase
    
    Log    This is skipped as it hangs the testing
    Skip

    Get Number Of Heroes
    Set Initial Number Of Heroes

    ${filename}  Evaluate  ${Non_Existing_CSV}

    Set Global Variable    ${filename}

    Sending Files Through FE

    
    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    
    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}
    
    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    ${national_id}    Set Variable    9999
    
    Set Global Variable    ${national_id}
    
    Check For Non Valid Not Added National ID
    
    FOR    ${nat_id}    IN    @{nat_id_list}
        ${national_id}    Set Variable    ${nat_id}
        Set Global Variable    ${national_id}
        Check For Valid Added National ID
        
    END

    ${log entries}=    Get Browser Console Log Entries    
    Log    ${log entries}

Verify Clerk Cannot Upload Invalid File Type Excel Non Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes an excel sheet which is a non csv using FE file upload.
    [Tags]  Clerk Invalid Upload    Non csv spreadsheet    FE file upload

    Set Initial Number Of Heroes

    ${filename}  Evaluate  ${Invalid_Non_CSV_Excel_File} 

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Fail

    END

    ${national_id}    Set Variable    9999

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Upload Invalid File Type Excel Non Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes an excel sheet which is a non csv using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    Non csv spreadsheet    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes

    ${response} =    Helpfunction.post_file_api    ${Invalid_Non_CSV_Excel_File}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9999

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Header Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with no header using FE file upload.
    [Tags]  Clerk Invalid Upload    No Header    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_no_header_requiremenet_csv

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

    ${national_id}    Set Variable    9999

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Header Csv Via API Call Causing 500 Error Code
 
    [Documentation]  This test case verifies clerk cannot upload heroes with no header using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    No header    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_no_header_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9999

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Birthday Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with no birthday using FE file upload.
    [Tags]  Clerk Invalid Upload    No birthday    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_no_birthdate_requiremenet_csv

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

    ${national_id}    Set Variable    9998

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Birthday Csv Via API Call Causing 500 Error Code
 
    [Documentation]  This test case verifies clerk cannot upload heroes with no birthday using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    No birthday    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_no_birthdate_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9998

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Birthday DDMMMYYYY Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong birthday format DDMMMYYYY using FE file upload.
    [Tags]  Clerk Invalid Upload    Wrong Birthday Format    DDMMMYYYY    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_birthdate_format_DDMMMYYYY_requiremenet_csv

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

    ${national_id}    Set Variable    9997

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Birthday DDMMMYYYY Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong birthday format DDMMMYYYY using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    Wrong Birthday Format    DDMMMYYYY    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_birthdate_format_DDMMMYYYY_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9997

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Birthday YYYYMMDD Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong birthday format YYYYMMDD using FE file upload.
    [Tags]  Clerk Invalid Upload    Wrong Birthday Format    YYYYMMDD    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_birthdate_format_YYYYMMDD_requiremenet_csv

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

    ${national_id}    Set Variable    9996

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Birthday YYYYMMDD Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong birthday format YYYYMMDD using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    Wrong Birthday Format    YYYYMMDD    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_birthdate_format_YYYYMMDD_requiremenet_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9996

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Long Form Gender Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong Gender format In Long Form using FE file upload.
    [Tags]  Clerk Invalid Upload    Wrong Gender Format    Long Form    FE file upload

    Set Initial Number Of Heroes
    @{nat_id_list}=    Helpfunction.create_hero_invalid_gender_long_form_csv

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

    ${national_id}    Set Variable    9995

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Long Form Gender Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong gender format Long Format using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    Wrong Gender Format    Long Format    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_gender_long_form_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    

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

    ${national_id}    Set Variable    9995

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Gender Number Format Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong Gender format In Number Form using FE file upload. This is a failed case
    [Tags]  Clerk Invalid Upload    Wrong Gender Format    Number Form    FE file upload
    
    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_gender_number_requirement_csv
    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}  

    Set Global Variable    ${filename}

    Sending Files Through FE


    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Log    This has failed due to wrong gender format accepting number
        Fail

    END

    ${national_id}    Set Variable    9994

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid Gender Number Format Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong gender format Number Format using API uploadLargeFileForInsertionToDatabase. This Case has failed
    [Tags]  Clerk invalid Upload    Wrong Gender Format    Number Format    API call    uploadLargeFileForInsertionToDatabase
    
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_gender_number_requirement_csv

    Set Global Variable    @{nat_id_list}
    
    Log    This has failed due to wrong gender format accepting number

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Fail

    END

    Sleep    2s     
    
    Reload Page
    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Log    This has failed due to wrong gender format accepting number
        Fail

    END

    ${national_id}    Set Variable    9994

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Salary Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with no salary using FE file upload. This is a pass case
    [Tags]  Clerk Invalid Upload    No Salary    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_no_salary_form_csv

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

    ${national_id}    Set Variable    9993

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Salary Input Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with no salary using API uploadLargeFileForInsertionToDatabase. This Case has passed
    [Tags]  Clerk invalid Upload    No Salary    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_no_salary_form_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9993

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Salary Input Format Alphabets Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong salary format using alphabet using FE file upload. This is a pass case
    [Tags]  Clerk Invalid Upload    Wrong Salary Format    Alphabet    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_form_alphabet_csv

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

    ${national_id}    Set Variable    9992

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Salary Input Format Alphabets Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong salary alphabet format using API uploadLargeFileForInsertionToDatabase. This Case has passed
    [Tags]  Clerk invalid Upload    Wrong Salary Format    Alphabet Format    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_form_alphabet_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9992

    Set Global Variable    ${national_id}
    
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Salary Input Format AlphaNumeric Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong salary format using alphanumeric using FE file upload. This is a pass case
    [Tags]  Clerk Invalid Upload    Wrong Salary Format    AlphaNumeric    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_form_alphanumeric_csv
    
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

    ${national_id}    Set Variable    9991

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Salary Input Format AlphaNumeric Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong salary alphanumeric format using API uploadLargeFileForInsertionToDatabase. This Case has passed
    [Tags]  Clerk invalid Upload    Wrong Salary Format    AlphaNumeric Format    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_form_alphanumeric_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9991

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Negative Salary Input Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong salary format accepting negative using FE file upload. This is a failed case
    [Tags]  Clerk Invalid Upload    Wrong Salary Format    Negative    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_negative_salary_form_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Log    This has failed as it accepts negative salary
        Fail
    
    END
    
    ${national_id}    Set Variable    9990
    
    Set Global Variable    ${national_id}
    
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Negative Salary Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong salary accepting negative using API uploadLargeFileForInsertionToDatabase. This Case has failed
    [Tags]  Clerk invalid Upload    Wrong Salary Format    Negative    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_negative_salary_form_csv
    
    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
    
        Log    This has failed for accepting negative salary
        Fail
    
    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Fail

    END

    ${national_id}    Set Variable    9990

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With 5 Decimal Places Salary Input Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong salary format accepting 5 decimal places using FE file upload. This is a failed case
    [Tags]  Clerk Invalid Upload    Wrong Salary Format    5 decimal places    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_5dp_form_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
        Log    This has failed for accept 5dp Salary
        Fail

    END

    ${national_id}    Set Variable    9989

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With 5 Decimal Places Salary Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong salary accepting 5 decimal places using API uploadLargeFileForInsertionToDatabase. This Case has failed
    [Tags]  Clerk invalid Upload    Wrong Salary Format    5 decimal places    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_salary_5dp_form_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}
        
        Log    This has failed for accepting 5 dp salary
        Fail

    END

    Sleep    2s         
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Fail

    END

    ${national_id}    Set Variable    9989

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Tax Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with no tax using FE file upload. This is a pass case
    [Tags]  Clerk Invalid Upload    No Tax    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_no_tax_form_csv

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

    ${national_id}    Set Variable    9988

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Tax Input Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with no tax using API uploadLargeFileForInsertionToDatabase. This Case has passed
    [Tags]  Clerk invalid Upload    No Tax    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_no_tax_form_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9988

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Tax Input Format Alphabets Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong tax format using alphabet using FE file upload. This is a pass case
    [Tags]  Clerk Invalid Upload    Wrong Tax Format    Alphabet    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_form_alphabet_csv

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

    ${national_id}    Set Variable    9987

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Tax Input Format Alphabets Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong salary alphabet format using API uploadLargeFileForInsertionToDatabase. This Case has passed
    [Tags]  Clerk invalid Upload    Wrong Tax Format    Alphabet Format    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_form_alphabet_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9987

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Tax Input Format AlphaNumeric Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong tax format using alphanumeric using FE file upload. This is a pass case
    [Tags]  Clerk Invalid Upload    Wrong Tax Format    AlphaNumeric    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_form_alphanumeric_csv

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

    ${national_id}    Set Variable    9986

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Wrong Tax Input Format AlphaNumeric Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong tax alphanumeric format using API uploadLargeFileForInsertionToDatabase. This Case has passed
    [Tags]  Clerk invalid Upload    Wrong Tax Format    AlphaNumeric Format    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_form_alphanumeric_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9986

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Negative Tax Input Input Csv Via FrontEnd
 
    [Documentation]  This test case verifies clerk cannot upload heroes with wrong tax format accepting negative using FE file upload. This is a failed case
    [Tags]  Clerk Invalid Upload    Wrong Tax Format    Negative    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_negative_tax_form_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Log    This has failed for accept negative tax
        Fail

    END

    ${national_id}    Set Variable    9985

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With Negative Tax Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong tax accepting negative using API uploadLargeFileForInsertionToDatabase. This Case has failed
    [Tags]  Clerk invalid Upload    Wrong Tax Format    Negative    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_negative_tax_form_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Log    This has failed for accepting negative tax
        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Log    This has failed for accepting negative tax
        Fail

    END

    ${national_id}    Set Variable    9985

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With 5 Decimal Places Tax Input Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong tax format accepting 5 decimal places using FE file upload. This is a failed case
    [Tags]  Clerk Invalid Upload    Wrong Tax Format    5 decimal places    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_5dp_form_csv

    Set Global Variable    @{nat_id_list}

    ${filename}  Evaluate  ${UploadFile}    

    Set Global Variable    ${filename}

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Log    This has failed accepting 5dp tax
        Fail

    END
    
    ${national_id}    Set Variable    9984
    
    Set Global Variable    ${national_id}
    
    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With 5 Decimal Places Tax Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes with wrong tax accepting 5 decimal places using API uploadLargeFileForInsertionToDatabase. This Case has failed
    [Tags]  Clerk invalid Upload    Wrong Tax Format    5 decimal places    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_hero_invalid_tax_5dp_form_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
    IF    ${check_response} == ${False}

        Log    This has failed accepting 5dp tax
        Fail

    END

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Log    This has failed accepting 5dp tax
        Fail

    END

    ${national_id}    Set Variable    9984

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Of One Hero With No Name Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes without a name using the FrontEnd File Uploader
    [Tags]  Clerk Invalid Upload    No Name    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_no_name_csv

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

    ${national_id}    Set Variable    9983

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No Name Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes without a name using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    No Name    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_no_name_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9983

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Of One Hero With No National Id Input Csv Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload heroes without a national id using the FrontEnd File Uploader
    [Tags]  Clerk Invalid Upload    No National Id    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_no_nat_id_csv

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

Verify Clerk Cannot Process Invalid Upload Of One Hero With No National Id Csv Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload heroes without a national Id using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    No National id    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_no_nat_id_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid National Id Format Less Than 4 Character Input Csv Via FrontEnd

    [Documentation]  To report as this case will crash the server . This test case verifies clerk cannot upload heroes with a national id less than 3 characters using the FrontEnd File Uploader
    [Tags]  Clerk Invalid Upload    Less Than 4 Character National Id    FE file upload    To report

    Log    This failed test case will crash the server
    Skip

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_less_than_4_char_nat_id_csv

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

Verify Clerk Cannot Process Invalid Upload Of One Hero With Invalid National Id Format Less Than 4 Character Via API Call Causing 500 Error Code

    [Documentation]  To report as this case will crash the server . This test case verifies clerk cannot upload heroes with a national Id less than 4 character using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    Less Than 4 Character National Id    API call    uploadLargeFileForInsertionToDatabase

    Log    This failed test case will crash the server
    Skip

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_less_than_4_char_nat_id_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

Verify Clerk Cannot Process Invalid Upload Csv File With Empty Rows Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload csv with empty rows using the FrontEnd File Uploader
    [Tags]  Clerk Invalid Upload    Empty Rows    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_empty_row_csv

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

    ${national_id}    Set Variable    9982

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload CSV With Empty Row Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload csv with empty rows using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    Empty Rows    API call    uploadLargeFileForInsertionToDatabase
  
    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_empty_row_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9982

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID


Verify Clerk Cannot Process Invalid Upload Csv File With Empty Column Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload csv with empty columns using the FrontEnd File Uploader
    [Tags]  Clerk Invalid Upload    Empty column    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_empty_column_csv

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

    ${national_id}    Set Variable    9981

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload CSV With Empty Column Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload csv with empty columns using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    Empty column    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_empty_column_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}

    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9981

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload Csv File With Missing Column Via FrontEnd

    [Documentation]  This test case verifies clerk cannot upload csv with missing columns using the FrontEnd File Uploader
    [Tags]  Clerk Invalid Upload    Missing column    FE file upload

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_missing_column_csv

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

    ${national_id}    Set Variable    9977

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

Verify Clerk Cannot Process Invalid Upload CSV With Missing Column Via API Call Causing 500 Error Code

    [Documentation]  This test case verifies clerk cannot upload csv with missing columns using API uploadLargeFileForInsertionToDatabase.
    [Tags]  Clerk invalid Upload    Missing column    API call    uploadLargeFileForInsertionToDatabase

    Set Initial Number Of Heroes
    
    @{nat_id_list}=    Helpfunction.create_missing_column_csv

    Set Global Variable    @{nat_id_list}

    ${response} =    Helpfunction.post_file_api    ${UploadFile}
    ${check_response} =    Helpfunction.check_non_success_response    ${response}
    
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

    ${national_id}    Set Variable    9977

    Set Global Variable    ${national_id}

    Check For Non Valid Not Added National ID

#Duplicated key
Verify Clerk Cannot Upload Duplicated Identical Id Via FE

    [Documentation]  This test case verifies clerk cannot upload duplicated national id
    [Tags]  Clerk Invalid Upload    Duplicated id

    Set Initial Number Of Heroes

    @{nat_id_list}=    Helpfunction.create_duplicated_ids_csv

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

    Sending Files Through FE

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}

        Log    This has failed for sending duplicate ids
        Fail
    
    END