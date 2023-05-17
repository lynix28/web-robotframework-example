*** Settings ***
Documentation    Resource file to open/access the website
Library    OperatingSystem
Library    Browser    run_on_failure=Take Screenshot \ ${PHOTO_SAVE_DIR}${TS}\_fail_screenshot_{index}
#Library    ScreenCapLibrary    screenshot_directory=${VIDEO_DIR}


*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chromium
${HEADLESS}    False
${PHOTO_SAVE_DIR}    ../../evidences/${TS}/screenshot/
${PHOTO_DIR}    ./${TS_EVIDENCE}screenshot/
#${VIDEO_DIR}    ./${TS_EVIDENCE}video/
${TS_EVIDENCE}    ./reports/evidences/${TS}/
${TS}    Test Suite ID


*** Keywords ***
Open Website
    [Documentation]    Custom Keyword to open MWP website and start recording
    [Arguments]    ${TSID}
    Create Directory    ${TS_EVIDENCE}
    Create Directory    ${PHOTO_DIR}
    #Create Directory    ${VIDEO_DIR}
    New Browser    browser=${BROWSER}    headless=${HEADLESS}    slowMo=0.10
    #Start Video Recording   None    ${TSID}\_recording
    Sleep    2
    New Page    ${URL}

Close Website
    [Documentation]    Custom Keyword to close/stop everything
    Sleep    2
    #Stop Video Recording
    Close Browser
