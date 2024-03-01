*** Variables ***
${even_message}    This number is even.
${odd message}    This number is odd.
${error message }    Can't figure out.

*** Test Cases ***
Even Numbers
    Even Or Odd    4
    Even Or Odd    0
    Even Or Odd    124

Odd Numbers
    Even Or Odd    1
    Even Or Odd    -3
    Even Or Odd    999

Error
    Even Or Odd    1/3


*** Keywords ***
Even Or Odd
    [Documentation]    Finds out if number is even or odd.
    [Arguments]    ${NUMBER}
    ${REMAINDER} =    Evaluate    ${number} % 2
    IF   ${REMAINDER} == 0
        Log    ${even message}
    ELSE IF    ${REMAINDER} == 1
        Log    ${odd message}
    ELSE
        Log    ${error message}
    END
    RETURN   ${NUMBER}
