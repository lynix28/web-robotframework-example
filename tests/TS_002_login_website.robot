*** Settings ***
Documentation    Test file about 'Login and Logout' as valid user credential
Resource         ../resources/pages/login.resource
Resource         ../resources/pages/logout.resource
Resource         ../resources/shared/user_data.resource
Force Tags       SanityTest
Suite Setup      Open Website    ${TS}
Suite Teardown   Close Website


*** Variables ***
${TS}    TS_002


*** Test Cases ***
TC_001 Success login to website
    [Documentation]  Test case to ensure user able login to website with valid credential
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Click Login Button
    Login Validation

TC_002 Success logout from website
    [Documentation]  Test case to ensure user able to logout from website
    Click Logout Button
