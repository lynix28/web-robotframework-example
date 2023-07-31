*** Settings ***
Documentation    Test file about 'Login' feature
Resource         ../resources/pages/login.resource
Resource         ../resources/pages/logout.resource
Resource         ../resources/shared/user_data.resource
Test Tags        SanityTest
Suite Setup      Open Website    ${TS}
Suite Teardown   Close Website


*** Variables ***
${TS}    TS_001


*** Test Cases ***
TC_001 Login to Sauce Demo website with valid credential
    [Documentation]
    ...  As a User,
    ...  I should be able to log in to Sauce Demo website,
    ...  and access my account
    Given Sauce Demo Login Page
    When I Enter A Valid Username    ${USERNAME}
    And I Enter A Valid Password    ${PASSWORD}
    And Click Login Button
    Then I Can Access My Account

TC_002 Login to Sauce Demo website with invalid credential
    [Documentation]
    ...  As a User,
    ...  I should not be able to log in to Sauce Demo website,
    ...  If I access it with invalid credential
    Given Sauce Demo Login Page
    When I Enter An Invalid Username    ${INVALID_USERNAME}
    And I Enter An Invalid Password    ${INVALID_PASSWORD}
    And Click Login Button
    Then I Will See An Error Message

TC_003 Logout from Sauce Demo website
    [Documentation]
    ...  As a User,
    ...  If I already logged in to Sauce Demo website,
    ...  I can log out from the website
    Given Sauce Demo Dashboard Page
    When I Open Side Menu
    And Click Logout Menu
    Then I Back To Login Page
