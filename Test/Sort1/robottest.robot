*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary
Library    XML
Library  ../Functest.py
Library  ../../Helpfunction.py
Library    Collections


*** Variables ***

*** Test Cases ***
Verify Successful Login to OrangeHRM
    [Documentation]  This test case verifies that user is able to successfully Login to OrangeHRM
    [Tags]  Smoke
    # HAHAHAHAHHAHAHAHAH
#    Wait Until Element Is Visible  id:txtUsername  timeout=10
#    Input Text  id:txtUsername  Admin
    # Wait Until Element Is Visible  name:username  timeout=10
    Wait Until Element Is Visible   xpath://*[@id="contents"]/div[1]/div[2]/label  timeout=10
    # Input Text  name:username  Admin

    # ${my_string}  Evaluate  r"/test1234.csv"
    # ${abc} =  Helpfunction.working_directory  ${my_string}
    # Log  ${abc}
    # Choose File    xpath://*[@id="contents"]/div[1]/div[2]/input    ${abc}
    
    ${happy}=    SeleniumLibrary.Get Element Count    xpath://*[@id="contents"]/div[2]/table/tbody/tr
    Log    ${happy}
    
    Table Column Should Contain    xpath://*[@id="contents"]    1    4444
    
    @{PriceList}=    Create List

    FOR    ${index}    IN RANGE    1    ${happy}+1

        ${var} =    Get Text    xpath://*[@id="contents"]/div[2]/table/tbody/tr[${index}]/td[2]
        Log    ${var}
        Append To List    ${PriceList}    ${var}    
    END
    
    ${sum_of_price} =    Set Variable    ${0.00}

    FOR    ${element}    IN    @{PriceList}
        Log To Console    ${element}
        ${inidcated} =    Set Variable    ${element}
        ${sum_of_price} =    Evaluate    ${sum_of_price}+${inidcated}
    END
    Log To Console    ${sum_of_price}
    ${test_round} =    Helpfunction.round_to_2_dp  ${sum_of_price}
    Log To Console    ${test_round}

    ${testText} =    Get Text    xpath://*[@id="contents"]/div[3]/div/p
    Log To Console    ${testText}
    ${larry_king} =    Helpfunction.splittext  ${testText}  ${sum_of_price}
    Log To Console    ${larry_king}


#    Input Password  id:txtPassword  admin123
#    Click Element  id:btnLogin
    # Input Password  name:password  admin123
    # Click Element  class:orangehrm-login-button
    # Click Element     xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
#    Element Should Be Visible  id:welcome  timeout=10
    # Element Should Be Visible  class:oxd-topbar-header-breadcrumb  timeout=10
#    oxd-topbar-header-breadcrumb
    # Close Browser

# Verify Successful Login to the-internet.herokuapp
#     [documentation]  This test case verifies that user is able to successfully Login to the-internet.herokuapp
#     [tags]  Smoke
#     Open Browser  https://the-internet.herokuapp.com/login  Chrome
#     Wait Until Element Is Visible  id:username  timeout=5
#     Input Text  id:username  tomsmith
#     Input Password  id:password  SuperSecretPassword!
#     Click Element  css:button[type="submit"]
#     Element Should Be Visible  css:[href="/logout"]  timeout=5
#     Close Browser

Verify MyBeautiful Function Is Working
    ${value} =  Functest.add_one_to_integer  ${4}
    Log  Hi
    Log  ${value}
    Should Be Equal  ${value}    ${5}

