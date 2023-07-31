*** Settings ***
Documentation    Resource file for 'Login' scenario
Resource    ../shared/base.resource
Resource    ../shared/user_data.resource


*** Variables ***
${LOGIN_LOGO}            xpath=//*[@id="root"]/div/div[1]
${LOGIN_USERNAME_FIELD}  xpath=//*[@id="user-name"]
${LOGIN_PASSWORD_FIELD}  xpath=//*[@id="password"]
${LOGIN_BUTTON}          xpath=//*[@id="login-button"]
${ERROR_MESSAGE_BOX}     xpath=//*[@id="login_button_container"]/div/form/div[3]/h3
${EXPECTED_URL}          https://www.saucedemo.com/inventory.html
${EXPECTED_ERROR_TEXT}   Epic sadface: Username and password do not match any user in this service


*** Keywords ***
Sauce Demo Login Page
    [Documentation]  A keyword to validate the Login Page elements are exist and It's loaded well.
    Go To    ${URL}
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
    Sleep  2

I Enter A Valid Username
    [Documentation]  A keyword to instruct the Robot to fill Username field.
    [Arguments]  ${Username}
    Wait For Elements State  ${LOGIN_USERNAME_FIELD}  visible  timeout=10s
    Click  ${LOGIN_USERNAME_FIELD}
    Type Text  ${LOGIN_USERNAME_FIELD}  ${Username}
    Sleep  2

I Enter An Invalid Username
    [Documentation]  A keyword to instruct the Robot to fill Username field.
    [Arguments]  ${Username}
    Wait For Elements State  ${LOGIN_USERNAME_FIELD}  visible  timeout=10s
    Click  ${LOGIN_USERNAME_FIELD}
    Type Text  ${LOGIN_USERNAME_FIELD}  ${Username}
    Sleep  2

I Enter A Valid Password
    [Documentation]  A keyword to instruct the Robot to fill Password field.
    [Arguments]  ${Password}
    Wait For Elements State  ${LOGIN_PASSWORD_FIELD}  visible  timeout=10s
    Click  ${LOGIN_PASSWORD_FIELD}
    Type Secret  ${LOGIN_PASSWORD_FIELD}  $Password
    Sleep  2

I Enter An Invalid Password
    [Documentation]  A keyword to instruct the Robot to fill Password field.
    [Arguments]  ${Password}
    Wait For Elements State  ${LOGIN_PASSWORD_FIELD}  visible  timeout=10s
    Click  ${LOGIN_PASSWORD_FIELD}
    Type Secret  ${LOGIN_PASSWORD_FIELD}  $Password
    Sleep  2

Click Login Button
    [Documentation]  A keyword to instruct the Robot to click Login Button.
    Wait For Elements State  ${LOGIN_BUTTON}  visible  timeout=10s
    Click  ${LOGIN_BUTTON}
    Sleep  2

I Can Access My Account
    [Documentation]  A keyword to instruct the Robot to validate the Login Process.
    ${URL}=  Get Url
    IF  "${URL}" != "${EXPECTED_URL}"
        ${Error_text}=  Get Text  ${ERROR_MESSAGE_BOX}
        IF  "${Error_text}" != ""
            Browser.Take Screenshot
            Fail
        END
    END
    Sleep  2

I Will See An Error Message
    [Documentation]  A keyword to instruct the Robot to make sure the Login process is return an error.
    Get Text  ${ERROR_MESSAGE_BOX}  ==  ${EXPECTED_ERROR_TEXT}

Sauce Demo Dashboard Page
    [Documentation]  A keyword to automatically logged in to Sauce Demo website.
    Go To    ${URL}
    I Enter A Valid Username    ${USERNAME}
    I Enter A Valid Password    ${PASSWORD}
    Click Login Button
