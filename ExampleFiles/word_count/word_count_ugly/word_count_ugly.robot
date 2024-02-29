*** Settings ***
Library    Browser
Suite Setup    New Browser    browser=firefox    headless=true
Test Setup   New Context    viewport={'width': 1920, 'height': 1080}
Test Teardown    Close Context
Suite Teardown    Close Browser
Test Tags    wordcount
Library    String
Library    Collections
Library    sortdict.py
Library    OperatingSystem

*** Variables ***
${planets}            https://en.wikipedia.org/wiki/Planet
${first_paragraph}    /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/p[2]

@{SELECTED WORDS}          planet    star    cloud    system    gravity   solar    moon
...       nebula    galaxy    earth

*** Test Cases ***
Count words in Wikipedia article
     ${text}=    Extract Text from Webpage    ${planets}     ${first_paragraph}
     ${wordcount}    Count Words In Text    ${text}    @{SELECTED_WORDS}
     Log   ${wordcount}

*** Keywords ***
Extract Text from Webpage
     [Arguments]    ${webpage}    ${locator}
     [Tags]    text
     [Documentation]    Fetches content from the website.
     [Setup]    New Page    ${webpage}
     [Teardown]    Close Page
     ${text}    Get Text    xpath=${locator}
     RETURN    ${text}

Count words In Text
     [Documentation]    Counts number of given words in a text. Returns sorted dictionary.
     [Tags]    words
     [Arguments]    ${text}    @{words}
     &{word_count}    Create Dictionary
     ${word_list}=      Split String           ${text}
     FOR    ${word}    IN    @{words}
     ${count}    Get Match Count    ${word_list}    pattern=${word}*    whitespace_insensitive=${False}    ignore_case=${True}
     Set To Dictionary    ${word_count}    ${word}    ${count}
     END
     ${sorted_count}    Sort Dictionary    ${word_count}
     RETURN    ${sorted_count}
