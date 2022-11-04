*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary
Library    XML
Library  ../Functest.py

*** Variables ***

*** Test Cases ***
# Verify Successful Login to OrangeHRM
#     [Documentation]  This test case verifies that user is able to successfully Login to OrangeHRM
#     [Tags]  Smoke
#     HAHAHAHAHHAHAHAHAH
# #    Wait Until Element Is Visible  id:txtUsername  timeout=10
# #    Input Text  id:txtUsername  Admin
#     Wait Until Element Is Visible  name:username  timeout=10
#     Input Text  name:username  Admin
# #    Input Password  id:txtPassword  admin123
# #    Click Element  id:btnLogin
#     Input Password  name:password  admin123
#     # Click Element  class:orangehrm-login-button
#     Click Element     xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
# #    Element Should Be Visible  id:welcome  timeout=10
#     Element Should Be Visible  class:oxd-topbar-header-breadcrumb  timeout=10
# #    oxd-topbar-header-breadcrumb
#     Close Browser

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

Verify MyBeautiful Function Is Working 2
    ${value} =  Functest.add_one_to_integer  ${5}
    Log  Hi
    Log  ${value}
    Should Be Equal  ${value}    ${6}

*** Keywords ***
HAHAHAHAHHAHAHAHAH
    Open Browser  https://opensource-demo.orangehrmlive.com/  Chrome