*** Settings ***

Suite Setup  Open Website The Oppenheimer Project

Library    SeleniumLibrary

Suite Teardown  Close All Browsers

Resource  ./Resources/resources.robot
