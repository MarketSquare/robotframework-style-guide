*** Settings ***
Library    Process

*** Test Cases ***
Varargs with user keywords
    Any Number Of Arguments
    Any Number Of Arguments    arg
    Any Number Of Arguments    arg1    arg2    arg3   arg4
    One Or More Arguments    required
    One Or More Arguments    arg1    arg2    arg3   arg4
    Required, Default, Varargs    required
    Required, Default, Varargs    required    optional
    Required, Default, Varargs    arg1    arg2    arg3    arg4    arg5

Example
    With Varargs    named=value
    With Varargs    positional    second positional    named=foobar
    Without Varargs    first=1    second=2
    Without Varargs    second=toka    first=eka
    With Positional    foo    named=bar
    With Positional    named=2    positional=1
    With Free Named    positional    named only=value    x=1    y=2
    With Free Named    foo=a    bar=b    named only=c    quux=d
    
*** Keywords ***
One Argument
    [Arguments]    ${arg_name}
    Log    Got argument ${arg_name}

Three Arguments
    [Arguments]    ${arg1}    ${arg2}    ${arg3}
    Log    1st argument: ${arg1}
    Log    2nd argument: ${arg2}
    Log    3rd argument: ${arg3}

One Argument With Default Value
    [Arguments]    ${arg}=default value
    [Documentation]    This keyword takes 0-1 arguments
    Log    Got argument ${arg}

Two Arguments With Defaults
    [Arguments]    ${arg1}=default 1    ${arg2}=${VARIABLE}
    [Documentation]    This keyword takes 0-2 arguments
    Log    1st argument ${arg1}
    Log    2nd argument ${arg2}

One Required And One With Default
    [Arguments]    ${required}    ${optional}=default
    [Documentation]    This keyword takes 1-2 arguments
    Log    Required: ${required}
    Log    Optional: ${optional}

 Default Based On Earlier Argument
    [Arguments]    ${a}    ${b}=${a}    ${c}=${a} and ${b}
    Should Be Equal    ${a}    ${b}
    Should Be Equal    ${c}    ${a} and ${b}

Any Number Of Arguments
    [Arguments]    @{varargs}
    Log Many    @{varargs}

One Or More Arguments
    [Arguments]    ${required}    @{rest}
    Log Many    ${required}    @{rest}

Required, Default, Varargs
    [Arguments]    ${req}    ${opt}=42    @{others}
    Log    Required: ${req}
    Log    Optional: ${opt}
    Log    Others:
    FOR    ${item}    IN    @{others}
        Log    ${item}
    END    

Free Named Only
    [Arguments]    &{named}
    Log Many    &{named}

Positional And Free Named
    [Arguments]    ${required}    &{extra}
    Log Many    ${required}    &{extra}

Run Program
    [Arguments]    @{args}    &{config}
    Run Process    program.py    @{args}    &{config}

With Varargs
    [Arguments]    @{varargs}    ${named}
    Log Many    @{varargs}    ${named}

Without Varargs
    [Arguments]    @{}    ${first}    ${second}
    Log Many    ${first}    ${second}

With Positional
    [Arguments]    ${positional}    @{}    ${named}
    Log Many    ${positional}    ${named}

With Free Named
    [Arguments]    @{varargs}    ${named only}    &{free named}
    Log Many    @{varargs}    ${named only}    &{free named}

With Default
    [Arguments]    @{}    ${named}=default
    Log Many    ${named}

With And Without Defaults
    [Arguments]    @{}    ${optional}=default    ${mandatory}    ${mandatory 2}    ${optional 2}=default 2    ${mandatory 3}
    Log Many    ${optional}    ${mandatory}    ${mandatory 2}    ${optional 2}    ${mandatory 3}    