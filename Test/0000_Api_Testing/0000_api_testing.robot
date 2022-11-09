*** Settings ***
Documentation    API Test Of Oppenheimer Project
Library    SeleniumLibrary
Library    XML
Library    ../../Helper_Functions/Helpfunction.py
Library    Collections
Resource    ../../Resources/resources.robot    


*** Variables ***
${initial_rows}
${init_text}

*** Test Cases ***

Verify insertRandomToDatabaseForNoReason Can Randomly Add More Than 1 Hero

    [Documentation]  This test case verifies api insertRandomToDatabaseForNoReason can randomly add more than 1 hero
    [Tags]  insertRandomToDatabaseForNoReason    randomly    more than 1 hero

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.insert_random_data

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${3}
    
        Fail
    
    END
    
    Pass Execution    Verified insertRandomToDatabaseForNoReason Can Randomly Add More Than 1 Hero

Verify insert Can Insert 1 Hero

    [Documentation]  This test case verifies api insert can insert 1 hero
    [Tags]    insert    1 hero

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.insert_1_person

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Can Insert 1 Hero

Verify insertMultiple Can insert more than 1 Hero

    [Documentation]  This test case verifies api insertmMltiple can insert more than 1 hero
    [Tags]    insert    1 hero

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.insert_multiple_people

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${2}
    
        Fail
    
    END
    
    Pass Execution    Verified insertMultiple Can insert more than 1 Hero

Verify rakeDatabase Can Remove All Heroes When There are Heroes

    [Documentation]  This test case verifies api rakeDatabase can remove all heroes where heroes are present
    [Tags]  rakeDatabase    remove    all heroes    heroes present

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Helpfunction.insert_random_data

    Set Initial Number Of Heroes

    IF    ${initial_number_of_heroes} == ${0}
    
        Fail
    
    END

    Sleep    2s     
    Reload Page

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Subsequent Number Of Heroes
    
    IF    ${subsequent_number_of_heroes} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified rakeDatabase Can Remove All Heroes When There are Heroes

Verify rakeDatabase Can Remove All Heroes When There are No Heroes

    [Documentation]  This test case verifies api rakeDatabase can remove all heroes
    [Tags]  rakeDatabase    remove    all heroes    heroes absent

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Helpfunction.insert_random_data

    Set Initial Number Of Heroes

    IF    ${initial_number_of_heroes} == ${0}
    
        Fail
    
    END

    Sleep    2s     
    Reload Page

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Subsequent Number Of Heroes
    
    IF    ${subsequent_number_of_heroes} != ${0}
    
        Fail
    
    END

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Subsequent Number Of Heroes
    
    IF    ${subsequent_number_of_heroes} != ${0}
    
        Fail
    
    END

    Pass Execution    Verified rakeDatabase Can Remove All Heroes When There are No Heroes