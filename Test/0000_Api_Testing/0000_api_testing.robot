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

Verify insert Can Insert 1 Hero With All Valid Data

    [Documentation]  This test case verifies api insert can insert 1 hero With All Valid Data
    [Tags]    insert    1 hero    All Valid Data

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.all_valid_data_insert_1_person

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${1}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Can Insert 1 Hero With All Valid Data

Verify insert Cannot Insert 1 Hero With Missing Name

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Missing Name
    [Tags]    Not insert    1 hero    Missing name

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.insert_1_person_missing_name

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Missing Name


Verify insert Cannot Insert 1 Hero With Missing Gender

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Missing Gender
    [Tags]    Not insert    1 hero    Missing Gender
    
    Skip
    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.insert_1_person_missing_gender

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Missing Gender

Verify insert Cannot Insert 1 Hero With Invalid Gender

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Invalid Gender
    [Tags]    Not insert    1 hero    Invalid Gender
    
    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.invalid_gender_insert_1_person

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Invalid Gender

Verify insert Cannot Insert 1 Hero With Missing National ID

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Missing National ID
    [Tags]    Not insert    1 hero    Missing national id

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.insert_1_person_missing_nat_id

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Missing National ID

Verify insert Cannot Insert 1 Hero With Invalid National ID

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Invalid National ID
    [Tags]    Not insert    1 hero    Invalid national id

    Skip
    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.invalid_national_id_insert_1_person

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Invalid National ID

Verify insert Cannot Insert 1 Hero With Missing Birthday

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Missing Birthday
    [Tags]    Not insert    1 hero    Missing Birthday

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.insert_1_person_missing_birthday

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Missing Birthday

Verify insert Cannot Insert 1 Hero With Invalid Birthday

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Invalid Birthday
    [Tags]    Not insert    1 hero    Invalid Birthday

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.invalid_birthday_insert_1_person

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Invalid Birthday

Verify insert Cannot Insert 1 Hero With Missing Salary

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Missing Salary
    [Tags]    Not insert    1 hero    Missing Salary

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.insert_1_person_missing_salary

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Missing Salary

Verify insert Cannot Insert 1 Hero With Invalid Salary

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Invalid Salary
    [Tags]    Not insert    1 hero    Invalid Salary

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.invalid_salary_insert_1_person

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Invalid Salary

Verify insert Cannot Insert 1 Hero With Missing Tax

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Missing Tax
    [Tags]    Not insert    1 hero    Missing Tax

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.insert_1_person_missing_tax

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Missing Tax

Verify insert Cannot Insert 1 Hero With Invalid Tax

    [Documentation]  This test case verifies api insert cannot insert 1 hero With Invalid Tax
    [Tags]    Not insert    1 hero    Invalid Tax

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes

    Helpfunction.invalid_tax_insert_1_person

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insert Cannot Insert 1 Hero With Invalid Salary

Verify insertMultiple Can insert more than 1 Hero All Entries Valid

    [Documentation]  This test case verifies api insertmMltiple can insert more than 1 hero when all entries are valid
    [Tags]    insert    1 hero    All Valid Entries

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes
    
    Helpfunction.insert_multiple_people_all_valid

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${2}
    
        Fail
    
    END
    
    Pass Execution    Verified insertMultiple Can insert more than 1 Hero For All Valid Entries

Verify insertMultiple Cannot insert any Hero All Entries Invalid

    [Documentation]  This test case verifies api insertmMltiple cannot insert any hero when all entries are invalid
    [Tags]    insert multiple    1 hero    No Valid Entries

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes
    
    Helpfunction.insert_multiple_people_non_valid

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insertMultiple Cannot insert any Hero All Entries Invalid

Verify insertMultiple Cannot insert any Hero Some Entries Invalid

    [Documentation]  This test case verifies api insertmMltiple cannot insert any hero when some entries are invalid
    [Tags]    insert multiple    1 hero    some Valid Entries

    Helpfunction.rakeDatabase

    Reload Page
    Sleep    2s

    Set Initial Number Of Heroes
    
    Helpfunction.insert_multiple_people_some_valid

    Sleep    2s     
    Reload Page

    Set Subsequent Number Of Heroes

    ${difference} =    Evaluate    ${subsequent_number_of_heroes}-${initial_number_of_heroes}

    IF    ${difference} != ${0}
    
        Fail
    
    END
    
    Pass Execution    Verified insertMultiple Cannot insert any Hero Some Entries Invalid

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