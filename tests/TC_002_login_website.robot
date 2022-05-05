*** Settings ***
Documentation    Test file about login into website as valid user
Resource         ../resources/access_website.robot
Resource         ../resources/login.robot
Resource         ../resources/user_data.robot
Force Tags       Sanity Test
Suite Setup      open website
Suite Teardown   Close Browser

*** Test Cases ***
Success login to website
    [Documentation]  Test case to ensure user can login to website with valid credential
    input username and password    ${Username}    ${Password}
    click login button