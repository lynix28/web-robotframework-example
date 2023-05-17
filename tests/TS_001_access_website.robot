*** Settings ***
Documentation    Test file about accessing website
Resource         ../resources/pages/login.resource
Force Tags       SmokeTest
Suite Setup      Open Website    ${TS}
Suite Teardown   Close Website


*** Variables ***
${TS}    TS_001


*** Test Cases ***
TC_001 Success access website
    [Documentation]  Test case to ensure the website is accessable
    Login Page Should Be Open
