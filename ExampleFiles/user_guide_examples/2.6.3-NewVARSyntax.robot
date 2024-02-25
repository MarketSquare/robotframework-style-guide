*** Comments ***
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#var-syntax


*** Test Cases ***
Scalar examples
     VAR    ${simple}       variable
     VAR    ${equals} =     this works too
     VAR    ${variable}     value contains ${simple}
     VAR    ${sentence}     This is a bit longer variable value
     ...                    that is split into multiple rows.
     ...                    These parts are joined with a space.
     VAR    ${multiline}    This is another longer value.
     ...                    This time there is a custom separator.
     ...                    As the result this becomes a multiline string.
     ...                    separator=\n
     ...    

List examples
     VAR    @{two items}     Robot    Framework
     VAR    @{empty list}
     VAR    @{lot of stuff}
     ...    first item
     ...    second item
     ...    third item
     ...    fourth item
     ...    last item

Dictionary examples
     VAR    &{two items}     name=Robot Framework    url=http://robotframework.org
     VAR    &{empty dict}
     VAR    &{lot of stuff}
     ...    first=1
     ...    second=2
     ...    third=3
     ...    fourth=4
     ...    last=5     

*** Variables ***
${SUITE}         this value is overridden

*** Test Cases ***
Scope example
    VAR    ${local}     local value
    VAR    ${TEST}      test value      scope=TEST
    VAR    ${SUITE}     suite value     scope=SUITE
    VAR    ${GLOBAL}    global value    scope=GLOBAL
    Should Be Equal    ${local}     local value
    Should Be Equal    ${TEST}      test value
    Should Be Equal    ${SUITE}     suite value
    Should Be Equal    ${GLOBAL}    global value
    Keyword
    Should Be Equal    ${TEST}      new test value
    Should Be Equal    ${SUITE}     new suite value
    Should Be Equal    ${GLOBAL}    new global value

Scope example, part 2
    Should Be Equal    ${SUITE}     new suite value
    Should Be Equal    ${GLOBAL}    new global value

*** Test Cases ***
IF/ELSE example
    IF    "${ENV}" == "devel"
        VAR    ${address}    127.0.0.1
        VAR    ${name}       demo
    ELSE
        VAR    ${address}    192.168.1.42
        VAR    ${name}       robot
    END

Inline IF
    IF    "${ENV}" == "devel"    VAR    ${name}    demo    ELSE    VAR    ${name}    robot

Dynamic name
    VAR    ${x}       y    # Normal assignment.
    VAR    ${${x}}    z    # Name created dynamically.
    Should Be Equal    ${y}    z

*** Keywords ***
Keyword
    Should Be Equal    ${TEST}      test value
    Should Be Equal    ${SUITE}     suite value
    Should Be Equal    ${GLOBAL}    global value
    VAR    ${TEST}      new ${TEST}      scope=TEST
    VAR    ${SUITE}     new ${SUITE}     scope=SUITE
    VAR    ${GLOBAL}    new ${GLOBAL}    scope=GLOBAL
    Should Be Equal    ${TEST}      new test value
    Should Be Equal    ${SUITE}     new suite value
    Should Be Equal    ${GLOBAL}    new global value     

