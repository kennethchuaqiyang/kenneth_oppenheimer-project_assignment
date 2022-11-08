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

Verify Initial Dispensing Of Cash When There Is Amount To Be Dispensed

    [Documentation]  This test case verifies the Governor can only dispnse cash when there are heroes
    [Tags]  Initial    Governor    No Heros No Cash    Heroes Present
    
    Get Number Of Heroes

     IF    ${number_of_users} == ${0}

      Fail
      Click On Dispense Now Button
      Sleep    5s
      Element Text Should Not Be    xpath://*[@id="app"]/div/main/div/div/div    Cash dispensed
      Open Website The Oppenheimer Project

     ELSE

      Click On Dispense Now Button
      Sleep    5s
      Wait Until Element Is Visible    xpath://*[@id="app"]/div/main/div/div/div
      Element Text Should Be    xpath://*[@id="app"]/div/main/div/div/div    Cash dispensed
      Open Website The Oppenheimer Project

     END   