*** Settings ***
Documentation    Initial Test That Governor Should Not Be Able To Dispense When There Are No Heroes For Oppenheimer Project
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
    
    Helpfunction.rakeDatabase
    
    Get Number Of Heroes

     IF    ${number_of_users} == ${0}
        Log    Failing this as this will block the testing if we proceed
      Fail

      Click On Dispense Now Button
      Sleep    5s

      Element Text Should Not Be    xpath://*[@id="app"]/div/main/div/div/div    Cash dispensed
        Log    Verified Initial Dispensing Of Cash When There Is Amount To Be Dispensed

      Open Website The Oppenheimer Project

     ELSE

      Click On Dispense Now Button
      Sleep    5s

      Wait Until Element Is Visible    xpath://*[@id="app"]/div/main/div/div/div
      Element Text Should Be    xpath://*[@id="app"]/div/main/div/div/div    Cash dispensed
        Log    Verified Initial Dispensing Of Cash When There Is Amount To Be Dispensed

      Open Website The Oppenheimer Project

     END   