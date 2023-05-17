*** Settings ***
Documentation    Resource file for 'Login' scenario
Resource    ../shared/base.resource


*** Variables ***
${LOGIN_LOGO}            xpath=//*[@id="root"]/div/div[1]
${LOGIN_USERNAME_FIELD}  xpath=//*[@id="user-name"]
${LOGIN_PASSWORD_FIELD}  xpath=//*[@id="password"]
${LOGIN_BUTTON}          xpath=//*[@id="login-button"]
${ERROR_MESSAGE_BOX}     xpath=//*[@id="login_button_container"]/div/form/div[3]/h3
${EXPECTED_URL}          https://www.saucedemo.com/inventory.html
${EXPECTED_ERROR_TEXT}   Epic sadface: Username and password do not match any user in this service


*** Keywords ***
Login Page Should Be Open
    [Documentation]  A keyword to validate the Login Page elements are exist and It's loaded well.
    ${Title}=  Get Title
    Get Title  ==  Swag Labs  message="Title is different | ${Title}"
    Wait For Elements State  ${LOGIN_LOGO}  visible  timeout=10s
    Get Style  ${LOGIN_LOGO}  text-align  ==  center
    Wait For Elements State  ${LOGIN_USERNAME_FIELD}  visible  timeout=10s
    Get Property  ${LOGIN_USERNAME_FIELD}  type  ==  text
    Wait For Elements State  ${LOGIN_PASSWORD_FIELD}  visible  timeout=10s
    Get Property  ${LOGIN_PASSWORD_FIELD}  type  ==  password
    Wait For Elements State  ${LOGIN_BUTTON}  visible  timeout=10s
    Get Property  ${LOGIN_BUTTON}  type  ==  submit
    Sleep  5

Input Username And Password
    [Documentation]  A keyword to instruct the Robot to fill Username and Password field.
    [Arguments]  ${Username}  ${Password}
    Wait For Elements State  ${LOGIN_USERNAME_FIELD}  visible  timeout=10s
    Click  ${LOGIN_USERNAME_FIELD}
    Type Text  ${LOGIN_USERNAME_FIELD}  ${Username}
    Wait For Elements State  ${LOGIN_PASSWORD_FIELD}  visible  timeout=10s
    Click  ${LOGIN_PASSWORD_FIELD}
    Type Secret  ${LOGIN_PASSWORD_FIELD}  $Password
    Sleep  5

Click Login Button
    [Documentation]  A keyword to instruct the Robot to click Login Button.
    Wait For Elements State  ${LOGIN_BUTTON}  visible  timeout=10s
    Click  ${LOGIN_BUTTON}
    Sleep  5

Login Validation
    [Documentation]  A keyword to instruct the Robot to validate the Login Process.
    ${URL}=  Get Url
    IF  "${URL}" != "${EXPECTED_URL}"
        ${Error_text}=  Get Text  ${ERROR_MESSAGE_BOX}
        IF  "${Error_text}" != ""
            Browser.Take Screenshot
            Fail
        END
    END
    Sleep  5

# Negative Case
Login Validation Expect Error
    [Documentation]  A keyword to instruct the Robot to make sure the Login process is return an error.
    Get Text  ${ERROR_MESSAGE_BOX}  ==  ${EXPECTED_ERROR_TEXT}
