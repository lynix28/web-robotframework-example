*** Settings ***
Documentation    Resource file to open/access the website
Library          BuiltIn
Library          Browser

*** Variables ***
${URL}        https://www.saucedemo.com/
${BROWSER}    chromium
${HEADLESS}   False

*** Keywords ***
open website
    New Browser  browser=${BROWSER}  headless=${HEADLESS}
    New Page  ${URL}

login page should be open
    ${Title}=  Get Title
    Get Title  ==  Swag Labs  message="Title is different | ${Title}"
    ${Login_logo}=  Get Element  xpath=//*[@id="root"]/div/div[1]
    Get Style  ${Login_logo}  text-align  ==  cente
    ${Login_username_field}=  Get Element  xpath=//*[@id="user-name"]
    Get Property  ${Login_username_field}  type  ==  text
    ${Login_password_field}=  Get Element  xpath=//*[@id="password"]
    Get Property  ${Login_password_field}  type  ==  password
    ${Login_button}=  Get Element  xpath=//*[@id="login-button"]
    Get Property  ${Login_button}  type  ==  submit
    Sleep  5