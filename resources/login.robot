*** Settings ***
Documentation    Resource file for 'Login' scenario
Library          BuiltIn
Library          Browser

*** Variables ***
${Login_username_field}  xpath=//*[@id="user-name"]
${Login_password_field}  xpath=//*[@id="password"]
${Login_button}          xpath=//*[@id="login-button"]
${Error_message_box}     xpath=//*[@id="login_button_container"]/div/form/div[3]/h3
${Expected_URL}          https://www.saucedemo.com/inventory.html
${Expected_error_text}   Epic sadface: Username and password do not match any user in this service

*** Keywords ***
input username and password
    [Arguments]  ${Username}  ${Password}
    Wait For Elements State  ${Login_username_field}  visible  timeout=10s
    Click  ${Login_username_field}
    Type Text  ${Login_username_field}  ${Username}
    Wait For Elements State  ${Login_password_field}  visible  timeout=10s  
    Click  ${Login_password_field}
    Type Secret  ${Login_password_field}  $Password
    Sleep  5

click login button
    Wait For Elements State  ${Login_button}  visible  timeout=10s  
    Click  ${Login_button}
    Sleep  5

login validation
    ${URL}=  Get Url
    IF  "${URL}" != "${Expected_URL}"
        ${Error_text}=  Get Text  ${Error_message_box}
        IF  "${Error_text}" != ""
            Take Screenshot
            Fail
        END
    END
    Sleep  5

# Negative Case
login validation expect error
    Get Text  ${Error_message_box}  ==  ${Expected_error_text}
                