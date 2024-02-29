*** Settings ***
Library    Browser.py
Suite Setup    New Browser    browser=firefox    headless=true
Test Setup   New Context    viewport={'width': 1920, 'height': 1080}
Test Timeout    2 minutes
Test Teardown    Close Context
Suite Teardown    Close Browser
Test Tags    wordcount
Library    String
Library    Collections
Library    sortdict.py
Library    JSONLibrary
Library    OperatingSystem

*** Variables ***
${json_file}            words.json

@{SELECTED WORDS}          planet    star    cloud    System    gravity   solar    moon
...       nebula    galaxy    earth

*** Test Cases ***
Count words in Wikipedia article
     ${text}=    Extract Text From Wikipedia
     ${wordcount}    Count Words In Text    ${text}    @{SELECTED_WORDS}
     Save Data In JSON    ${wordcount}

*** Keywords ***
Extract Text From Wikipedia
     [Tags]    text
     [Documentation]    Fetches first two paragraphs from Wikipedia article.
     [Setup]    New Page    https://en.wikipedia.org/wiki/Planet
     [Teardown]    Close Page
     ${text}    Get Text    xpath=/html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/p[2]
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

Save Data In JSON
    [Arguments]    ${data}    ${filename}=${json_file}
     Dump Json To File    ${filename}    ${data}
    File Should Not Be Empty    ${filename}