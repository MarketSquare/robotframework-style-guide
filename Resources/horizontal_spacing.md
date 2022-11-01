# Horizontal Spacing

The recommended file format is the [space separated format](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#space-separated-format), which means that spacing between tokes is **4 spaces**

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

The `*** Settings ***` section should always be left aligned without any indentation ([Robocop: 1016](https://robocop.readthedocs.io/en/stable/rules.html#suite-setting-should-be-left-aligned))

```robot
*** Settings ***
Library      Collections
Resource     data.resource
Variables    vars.robot
```

The `*** Variables ***` secion should always be left aligned without any indentation ([Robocop: 1014](https://robocop.readthedocs.io/en/stable/rules.html#variable-should-be-left-aligned))

```robot
*** Variables ***
${VAR}     my variable
${VAR2}    2
```

## Line Length

A line length of 120 characters is recommended. This should fit on most screens. ([Robocop: 0508](https://robocop.readthedocs.io/en/stable/rules.html#line-too-long))

## Spacing in SettingsHeaders

Arguments to settings keywords should be aligned according to the longest keyword added with 4 spaces.

Arguments to libraries should be aligned if there are multiple libraries that have arguments on importing.

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
Blocks like `FOR`, `IF` or `WHILE` should always be indented such that the keywords that are run within the loop have to be indented from the lines that start and end the block. ([Robocop: 1008](https://robocop.readthedocs.io/en/stable/rules.html#bad-indent))

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

## Comments

In comments there should be a space between the `#` and the actual comment. ([Robocop: 0702](https://robocop.readthedocs.io/en/stable/rules.html#missing-space-after-comment))

Comments should be aligned with the block they belong to.

```robot
# Comment about Some Keyword here
Some Keyword
    Called Keyword One
    # Comment about Called Keyword Two here
    Called Keyword Two
```