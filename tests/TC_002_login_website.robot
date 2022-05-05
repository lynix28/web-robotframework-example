*** Settings ***
Documentation    Test file about 'Login and Logout' as valid user credential
Resource         ../resources/access_website.robot
Resource         ../resources/login.robot
Resource         ../resources/logout.robot
Resource         ../resources/user_data.robot
Force Tags       Sanity Test
Suite Setup      open website
Suite Teardown   Close Browser

*** Test Cases ***
Success login to website
    [Documentation]  Test case to ensure user able login to website with valid credential
    input username and password    ${Username}    ${Password}
    click login button

Success logout from website
    [Documentation]  Test case to ensure user able to logout from website
    click logout button