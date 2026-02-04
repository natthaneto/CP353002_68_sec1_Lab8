*** Settings ***
Library    SeleniumLibrary
Suite Setup      Open Browser To Login Page
Suite Teardown   Close Browser 

*** Variables ***
${URL}           https://computing.kku.ac.th
${EXPECTED_TITLE}    College of Computing, Khon Kaen University

*** Test Cases ***
Open Website Should Work
    SeleniumLibrary.Title Should Be    ${EXPECTED_TITLE}

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    Create Webdriver    Chrome    options=${chrome_options}    executable_path=/usr/bin/chromedriver
    Go To    ${URL}
