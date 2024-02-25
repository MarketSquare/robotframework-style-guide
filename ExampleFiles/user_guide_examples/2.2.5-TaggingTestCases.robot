*** Comments ***
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#tagging-test-cases

*** Settings ***
Test Tags       requirement: 42    smoke

*** Variables ***
${HOST}         10.0.1.42

*** Test Cases ***
No own tags
    [Documentation]    Test has tags 'requirement: 42' and 'smoke'.
    No Operation

Own tags
    [Documentation]    Test has tags 'requirement: 42', 'smoke' and 'not ready'.
    [Tags]    not ready
    No Operation

Own tags with variable
    [Documentation]    Test has tags 'requirement: 42', 'smoke' and 'host: 10.0.1.42'.
    [Tags]    host: ${HOST}
    No Operation

Remove common tag
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    -smoke
    No Operation

Remove common tag using a pattern
    [Documentation]    Test has only tag 'smoke'.
    [Tags]    -requirement: *
    No Operation

Set Tags and Remove Tags keywords
    [Documentation]    This test has tags 'smoke', 'example' and 'another'.
    Set Tags    example    another
    Remove Tags    requirement: *