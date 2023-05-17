*** Settings ***
Documentation    Test file about 'Login' scenario with invalid user credential
Resource         ../resources/pages/login.resource
Resource         ../resources/shared/user_data.resource
Force Tags       SanityTest
Suite Setup      Open Website    ${TS}
Suite Teardown   Close Website


*** Variables ***
${TS}    TS_003


*** Test Cases ***
TC_001 Failed login to website
    [Documentation]  Test case to ensure user unable to login with invalid credential
    Input Username And Password    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Click Login Button
    Login Validation Expect Error
