*** Settings ***
Documentation    Test file about 'Login' scenario with invalid user credential
Resource         ../resources/access_website.robot
Resource         ../resources/login.robot
Resource         ../resources/logout.robot
Resource         ../resources/user_data.robot
Force Tags       Sanity Test
Suite Setup      open website
Suite Teardown   Close Browser

*** Test Cases ***
Failed login to website
    [Documentation]  Test case to ensure user unable to login with invalid credential
    input username and password    ${Invalid_username}    ${Invalid_password}
    click login button
    login validation expect error