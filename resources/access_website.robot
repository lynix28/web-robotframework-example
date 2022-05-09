*** Settings ***
Documentation    Resource file to open/access the website
Library          BuiltIn
Library          Browser

*** Variables ***
${URL}                     https://www.saucedemo.com/
${BROWSER}                 chromium
${HEADLESS}                False

${Login_logo}              xpath=//*[@id="root"]/div/div[1]
${Login_username_field}    xpath=//*[@id="user-name"]
${Login_password_field}    xpath=//*[@id="password"]
${Login_button}            xpath=//*[@id="login-button"]

*** Keywords ***
open website
    New Browser  browser=${BROWSER}  headless=${HEADLESS}
    New Page  ${URL}

login page should be open
    ${Title}=  Get Title
    Get Title  ==  Swag Labs  message="Title is different | ${Title}"
    Wait For Elements State  ${Login_logo}  visible  timeout=10s
    Get Style  ${Login_logo}  text-align  ==  center
    Wait For Elements State  ${Login_username_field}  visible  timeout=10s
    Get Property  ${Login_username_field}  type  ==  text
    Wait For Elements State  ${Login_password_field}  visible  timeout=10s
    Get Property  ${Login_password_field}  type  ==  password
    Wait For Elements State  ${Login_button}  visible  timeout=10s
    Get Property  ${Login_button}  type  ==  submit
    Sleep  5