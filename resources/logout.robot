*** Settings ***
Documentation    Resource file for 'Logout' scenario
Library          BuiltIn
Library          Browser

*** Variables ***  
${Menu_button}         xpath=//*[@id="react-burger-menu-btn"]
${Side_menu}           xpath=//*[@id="menu_button_container"]/div/div[2]/div[1]/nav
${Logout_button}       xpath=//*[@id="logout_sidebar_link"]

${Expected_menu_list}         All ItemsAboutLogoutReset App State
${Expected_after_logout_URL}  https://www.saucedemo.com/

*** Keywords ***
click logout button
    Wait For Elements State  ${Menu_button}  visible  timeout=10s
    Click  ${Menu_button}
    Wait For Elements State  ${Side_menu}  visible  timeout=10s
    Get Property  ${Side_menu}  textContent  ==  ${Expected_menu_list}
    Wait For Elements State  ${Logout_button}  visible  timeout=10s
    Click  ${Logout_button}
    Sleep  5
    logout validation

logout validation
    ${URL}=  Get Url
    IF  "${URL}" != "${Expected_after_logout_URL}"
        Log  ${Expected_URL}
        Take Screenshot
        Fail
    END
    Sleep  5