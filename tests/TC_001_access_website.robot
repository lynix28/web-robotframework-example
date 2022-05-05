*** Settings ***
Documentation    Test file about accessing website
Resource         ../resources/access_website.robot
Force Tags       Smoke Test
Suite Teardown   Close Browser

*** Test Cases ***
Success access website
    [Documentation]  Test case to ensure the website is accessable
    open website
    login page should be open