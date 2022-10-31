# Horizontal Spacing

The recommended file format is the [space separated format](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#space-separated-format), which means that spacing between tokes is **4 spaces**

While other spacing is allowed, a minimum of 2 spaces is needed for the robot framework parser.
The 4 spaces are for readability and lesser chance of missing out on spaces that are not very well visible. Using spaces instead of other allowed characters like `|` or a tab (`\t`)

- Separators in line
  - [v] Separators between Keywords and Arguments
  - [v] Separators between Arguments
  - [v] Separators in Statements (FOR, IF, WHILE)
  - [v] Separators between Variables and Keyword
  - Space between Vars and = ? (and whether to use "=" at all)
  - Separators before Comments and after comment char
  - Alignment/Separators Line Continuation
- Indentation of Blocks
  - [v] IF Blocks, TRY/CATCH, WHILE, FOR (END)
  - High Level Blocks = Required indention of Keywords within Test Cases
- [v] Trailing Spaces?
  - [#trailing-whitespace](https://robocop.readthedocs.io/en/stable/rules.html#trailing-whitespace)
- [v] Spacing in SettingsHeaders

- Indentation to block (in some cases)
- [v] Max. length of lines (_does belong here?_)

## Trailing whitespaces

Trailing whitespaces should be avoided. [#trailing-whitespace](https://robocop.readthedocs.io/en/stable/rules.html#trailing-whitespace)

## Prepending whitespaces

Indentations should only be added when needed.

The `*** Settings ***` section should always be left alligned without any indentation ([Robocop: 1016](https://robocop.readthedocs.io/en/stable/rules.html#suite-setting-should-be-left-aligned))

```robot
*** Settings ***
Library      Collections
Resource     data.resource
Variables    vars.robot
```

The `*** Variables ***` secion should always be left alligned without any indentation ([Robocop: 1014](https://robocop.readthedocs.io/en/stable/rules.html#variable-should-be-left-aligned))

```robot
*** Variables ***
${VAR}     my variable
${VAR2}    2
```

## Line Length

A line length of 120 characters is recommended. This should fit on most screens.

## Spacing in SettingsHeaders

Within the Settings header it is recommended to allign the arguments to settings keywords according to the longest keyword added with 4 spaces. Arguments to Libraries should be alligned if there are multiple libraries that have arguments on importing.

```robot
*** Settings ***

Library       String
Library       XML       use_lxml=False
Library       Telnet    timeout=3s    newline=CLRF    encodeing=UTF-8
Resource      ${resourcedir}/mykeywords.resource
Resource      ${resourcedir}/myotherkeywords.resource
Force Tags    mytag

```

## Block Spacing
Blocks like `FOR`, `IF` or `WHILE` should always be indented such that the keywords that are run within the loop have one more spacing than the lines that start and end the block.

(examples from the userguide)

[FOR](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-365)
```robot
*** Test Cases ***
Example
    FOR    ${animal}    IN    cat    dog
        Log    ${animal}
        Log    2nd keyword
    END
    Log    Outside loop

Second Example
    FOR    ${var}    IN    one    two    ${3}    four    ${five}
    ...    kuusi    7    eight    nine    ${last}
        Log    ${var}
    END
```
[WHILE](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-377)
```robot
*** Test Cases ***
Limit as iteration count
    WHILE    True    limit=100
        Log    This is run 100 times.
    END
```
[IF/ELSE](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-384)
```robot
*** Test Cases ***
Example
    IF    $rc > 0
        Positive keyword
    ELSE IF    $rc < 0
        Negative keyword
    ELSE IF    $rc == 0
        Zero keyword
    ELSE
        Fail    Unexpected rc: ${rc}
    END

```
