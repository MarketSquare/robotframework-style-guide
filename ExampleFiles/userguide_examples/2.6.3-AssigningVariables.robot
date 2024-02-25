*** Comment ***
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#creating-variables


*** Variables ***
# Creating List Variables
@{NAMES}        Matti       Teppo
@{NAMES2}       @{NAMES}    Seppo
@{NOTHING}
@{MANY}         one         two      three      four
...             five        six      seven
# Creating Dictionary Variables
&{USER 1}       name=Matti    address=xxx         phone=123
&{USER 2}       name=Teppo    address=yyy         phone=456
&{MANY}         first=1       second=${2}         ${3}=third
&{EVEN MORE}    &{MANY}       first=override      empty=
...             =empty        key\=here=value

# Assigning Variables With Item Values
*** Test Cases ***
Item assignment to list
    ${list} =          Create List      one    two    three    four
    ${list}[0] =       Set Variable     first
    ${list}[${1}] =    Set Variable     second
    ${list}[2:3] =     Evaluate         ['third']
    ${list}[-1] =      Set Variable     last
    Log Many           @{list}          # Logs 'first', 'second', 'third' and 'last'

Item assignment to dictionary
    ${dict} =                Create Dictionary    first_name=unknown
    ${dict}[first_name] =    Set Variable         John
    ${dict}[last_name] =     Set Variable         Doe
    Log                      ${dictionary} 

Assign multiple
    ${a}    ${b}    ${c} =    Get Three
    ${first}    @{rest} =    Get Three
    @{before}    ${last} =    Get Three
    ${begin}    @{middle}    ${end} =    Get Three

*** Keywords ***
Get Three
    RETURN   1    2    C    