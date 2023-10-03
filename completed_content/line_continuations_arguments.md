## Line Continuation For Arguments

Recommended use of line continuation when having more than one arguments as described in the Robot Framework User Guide:
[User keyword arguments](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#user-keyword-arguments).

General guidelines:

- Try limiting the number of arguments to 5 ([Robocop: #too-many-arguments](https://robocop.readthedocs.io/en/stable/rules_list.html#too-many-arguments-w0507)).
- One argument per continuation line.
- Continuation line should not be indented.
- Line continuation character (`...`) should be placed at the beginning of the new row.
- No empty lines between arguments.
- No empty continuation lines between arguments (i.e., lines containing only `'...'`)
- If many arguments are required, consider representing them as a list or a dictionary.

---

### Line Continuation for Arguments in Keyword definition

In Keywords, the very first argument should be placed on the same line as `[Arguments]` setting. Every other argument
should be placed on a new continuation line and aligned with the argument on the previous line.

EXAMPLES

#### Required Arguments

Required arguments placed on continuation lines:

```robot
*** Keywords ***
Custom Keyword With Five Required Arguments
    [Arguments]    ${name}
    ...            ${surname}
    ...            ${street}
    ...            ${block}
    ...            ${apartment}
    Do Something
```

#### Optional Arguments

Optional arguments, due to having a default value, follow the same line continuation rules as required arguments:

```robot
*** Keywords ***
Custom Keyword With Various Optional Arguments
    [Arguments]    ${first_arg}=the first argument
    ...            ${second_arg}=${123}
    ...            ${third_arg}=${some_list}
    ...            ${fourth_arg}=${some_dict}
    ...            ${fifth_arg}=the last argument
    Do Something
```

#### Required and Optional Arguments Together

Here, all required arguments are listed first, and optional arguments with default values afterwards (please note that this is a requirement within Robot Framework).
Each argument is placed on a single continuation line, as before:

```robot
*** Keywords ***
Custom Keyword With Required And Optional Arguments
    [Arguments]    ${argument1}
    ...            ${argument2}
    ...            ${argument3}=this is a default value
    ...            ${argument4}=9999
    ...            ${argument5}=${EMPTY}
    Do Something
```

#### Embedded Arguments

Unlike required and optional arguments, embedded arguments cannot be split over lines, since
in this case, arguments become part of the Keyword name.

In the below example, the Keyword contains two embedded arguments, `${country}` and `${number}`.
The entire Keyword has to be on a single line:

```robot
*** Keywords ***
Get Capital Of "${country}" And First "${number}" Cities With Biggest Population
    Do Something
```

### Line Continuation for Arguments in Test Cases

In Test Cases, the first argument should be placed on the same line as the Keyword to which it belongs.
Every other argument should be placed on a new continuation line and separated from the cantinuation character
by exactly four spaces. Following arguments should be aligned with the argument on the previous line.
This is different from the argument formatting in the Keywords definition.
The reason is that test cases might include several Keywords with arguments and overly sparse
formatting may result in difficult to read test cases.

EXAMPLES

```robot
*** Test Cases ***
Test Case With Many Keywords And Arguments
    Do Something
    Use Keyword With Five Arguments    name=Name
    ...    surname=Surname
    ...    street=Somestreet 123
    ...    block=45
    ...    apartment=6
    Do Something Else
    Use Another Keyword With Arguments    123
    ...    abcdef
    ...    ${True}
    ...    @{mylist}
    Do A Lot Of Stuff
    More Stuff
    Use One More Keyword With Various Arguments
    ...    abc
    ...    123
    ...    optional_arg=12345
    ...    another_optional_arg=Hello
    Use Keyword With "two" Embedded Arguments And "three" Required Arguments    first_arg
    ...    second_arg
    ...    third_arg
    Do Final Steps
```

If Test Cases include Keywords with relatively short names and with only a few arguments,
then arguments can be accomodated on a single line if the maximum length of the line is not
exceeded. Mixing single-line and vertical listing should be avoided within the same test case,
and either one or the other should be chosen:

```robot
*** Test Cases ***
Test Case With Compact Contents
    Log To Console    message=Hello    stream=STDERR
    Sleep    10s    reason=Wait
    Catenate    SEPARATOR=    Robot    Framework
```
