*** Settings ***
Documentation     This example is to demonstrate how tidy test code may look like.

Library           Collections
Library           OperatingSystem
Library           String
Library           Browser
Library           sortdict.py

Suite Setup       New Browser    browser=firefox    headless=true
Suite Teardown    Close Browser
Test Setup        New Context    viewport={'width': 1920, 'height': 1080}
Test Teardown     Close Context

Test Tags         wordcount


*** Variables ***
${PLANETS}            https://en.wikipedia.org/wiki/Planet
${FIRST PARAGRAPH}    /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/p[2]
@{SELECTED WORDS}     planet
...                   star
...                   cloud
...                   system
...                   gravity
...                   solar
...                   moon
...                   nebula
...                   galaxy
...                   earth


*** Test Cases ***
Count Words In Wikipedia Article
    ${text}    Extract Text From Webpage    ${PLANETS}    ${FIRST PARAGRAPH}
    ${wordcount}    Count Words In Text    ${text}    @{SELECTED WORDS}
    Log    ${wordcount}


*** Keywords ***
Extract Text From Webpage
    [Documentation]    Fetches content from the website.
    [Tags]    text
    [Arguments]    ${webpage}    ${locator}
    [Setup]    New Page    ${webpage}
    ${text}    Get Text    xpath=${locator}
    RETURN    ${text}
    [Teardown]    Close Page

Count Words In Text
    [Documentation]    Counts number of given words in a text. Returns sorted dictionary.
    [Tags]    words
    [Arguments]    ${text}    @{words}
    &{word count}    Create Dictionary
    ${word list}    Split String    ${text}

    FOR    ${word}    IN    @{words}
        ${count}    Get Match Count    ${word list}
        ...    pattern=${word}*
        ...    whitespace_insensitive=${False}
        ...    ignore_case=${True}
        Set To Dictionary    ${word count}    ${word}    ${count}
    END

    ${sorted count}    Sort Dictionary    ${word count}
    RETURN    ${sorted count}
