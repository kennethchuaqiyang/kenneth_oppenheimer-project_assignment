*** Settings ***

Suite Setup  Open Website The Oppenheimer Project

Library    SeleniumLibrary

# Suite Teardown  Close All Browsers
Suite Teardown    Run Keyword And Ignore Error  Suite shutdown

Resource  ./Resources/resources.robot

*** Keywords ***
Suite shutdown
     Close All Browsers