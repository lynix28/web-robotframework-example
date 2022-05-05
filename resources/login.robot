*** Settings ***
Documentation    Resource file for 'Login' scenario
Library          BuiltIn
Library          Browser

*** Variables ***
${Error_message_box}    //*[@id="login_button_container"]/div/form/div[3]/h3
${Expected_URL}         https://www.saucedemo.com/inventory.html

*** Keywords ***
input username and password
    [Arguments]  ${Username}  ${Password}
    ${Login_username_field}=  Get Element  xpath=//*[@id="user-name"]
    Click  ${Login_username_field}
    Type Text  ${Login_username_field}  ${Username}
    ${Login_password_field}=  Get Element  xpath=//*[@id="password"]
    Click  ${Login_password_field}
    Type Secret  ${Login_password_field}  $Password
    Sleep  5

click login button
    ${Login_button}=  Get Element  xpath=//*[@id="login-button"]
    Click  ${Login_button}
    Sleep  5
    login validation

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