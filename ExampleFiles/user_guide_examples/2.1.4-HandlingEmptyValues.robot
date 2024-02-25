*** Comments ***
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#rules-for-parsing-the-data


*** Test Cases ***
Using backslash
    Do Something    first arg    \
    Do Something    \            second arg

Using ${EMPTY}
    Do Something    first arg    ${EMPTY}
    Do Something    ${EMPTY}     second arg

*** Keywords ***
Do Something
    [Arguments]    ${first}    ${second}
    Log   ${first} ${second}    CONSOLE
