*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary
Library    XML
Library    Process


*** Keywords ***

Open Website The Oppenheimer Project

    Open Browser  http://localhost:8080/  Chrome

    Wait Until Element Is Visible    xpath://*[@id="contents-main"]


Get Users From Database

    Run Process    curl 'http://localhost:8080/calculator/taxRelief'