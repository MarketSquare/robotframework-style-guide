*** Settings ***
Documentation       Resources follow the same rules as test cases and tasks

Library             Collections
Library             String


*** Variables ***
${EXAMPLE_RESOURCE_SCALAR}      This is a really really really really really really really really really really really
...                             really really really really really really really long string.


*** Keywords ***
A Small Keyword
    [Documentation]    Small keyword documentation.
    ${small_variable}    Catenate    SEPARATOR=    Such    a    small    keyword
    RETURN    ${small_variable}

This Is A Complex Keyword With Sections
    [Documentation]    Complex keyword documentation.
    [Arguments]    ${an_argument}
    ${local_list}    Create List
    ${get_small_value}    A Small Keyword
    ${words}    Split String    ${get_small_value}
    FOR    ${word}    IN    @{words}
        ${characters}    Split String To Characters    ${word}

        # Insert one vertical whitespace here to separate logical sections within a keyword.
        FOR    ${character}    IN    @{characters}
            IF    $character in 'aeiou'
                Append To List    ${local_list}    ${character}_${an_argument}
            END
        END
    END
    RETURN    ${local_list}
