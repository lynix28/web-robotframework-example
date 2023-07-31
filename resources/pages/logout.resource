*** Settings ***
Documentation    Resource file for 'Logout' scenario
Resource         ../shared/base.resource
Resource         login.resource


*** Variables ***
${MENU_BUTTON}         xpath=//*[@id="react-burger-menu-btn"]
${SIDE_MENU}           xpath=//*[@id="menu_button_container"]/div/div[2]/div[1]/nav
${LOGOUT_BUTTON}       xpath=//*[@id="logout_sidebar_link"]

${EXPECTED_MENU_LIST}         All ItemsAboutLogoutReset App State
${EXPECTED_AFTER_LOGOUT_URL}  https://www.saucedemo.com/


*** Keywords ***
I Open Side Menu
    [Documentation]  A keyword to instruct the Robot to click the Side menu
    Wait For Elements State  ${MENU_BUTTON}  visible  timeout=10s
    Click  ${MENU_BUTTON}
    Wait For Elements State  ${SIDE_MENU}  visible  timeout=10s
    Get Property  ${SIDE_MENU}  textContent  ==  ${EXPECTED_MENU_LIST}

Click Logout Menu
    [Documentation]  A keyword to instruct the Robot to click the Logout Button.
    Wait For Elements State  ${LOGOUT_BUTTON}  visible  timeout=10s
    Click  ${LOGOUT_BUTTON}
    Sleep  2

I Back To Login Page
    [Documentation]  A keyword to instruct the Robot to validate the Logout process.
    ${URL}=  Get Url
    IF  "${URL}" != "${EXPECTED_AFTER_LOGOUT_URL}"
        Log  ${EXPECTED_URL}
        Browser.Take Screenshot
        Fail
    END
    Sleep  2
