*** Comments ***
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#for-loops


*** Variables ***
@{ELEMENTS}    elem1    elem2   elem3
@{EMPLOYERS}    Vala   Eficode   Imbus


*** Test Cases ***
Example
    FOR    ${animal}    IN    cat    dog
        Log    ${animal}
        Log    2nd keyword
    END
    Log    Outside loop

Second Example
    VAR    ${five}    five
    VAR   ${last}   last
    FOR    ${var}    IN    one    two    ${3}    four    ${five}
    ...    kuusi    7    eight    nine    ${last}
        Log    ${var}
    END

Example
    FOR    ${element}    IN    @{ELEMENTS}
        Start Element    ${element}
    END

Multiple nesting levels
    FOR    ${root}    IN    r1    r2
        FOR    ${child}    IN    c1   c2    c3
            FOR    ${grandchild}    IN    g1    g2
                Log Many    ${root}    ${child}    ${grandchild}
            END
        END
        FOR    ${sibling}    IN    s1    s2    s3
            IF    '${sibling}' != 's2'
                Log Many    ${root}    ${sibling}
            END
        END
    END

Multiple loop variables
    FOR    ${index}    ${english}    ${finnish}    IN
    ...    1           cat           kissa
    ...    2           dog           koira
    ...    3           horse         hevonen
        Add Translation    ${english}    ${finnish}    ${index}
    END
    FOR    ${name}    ${id}    IN    @{EMPLOYERS}
        Create    ${name}    ${id}
    END


*** Keywords ***
Handle Cell
    [Arguments]    ${cell}
    No Operation

Handle Table
    [Arguments]    @{table}
    FOR    ${row}    IN    @{table}
        FOR    ${cell}    IN    @{row}
            Handle Cell    ${cell}
        END
    END     

Add Translation
    [Arguments]    ${english}    ${finnish}    ${index}
    No Operation

Start Element
    [Arguments]    ${element}
    No Operation

Create
    [Arguments]    ${name}    ${id}
    No operation
    

