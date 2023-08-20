# Horizontal Spacing

Separation of tokens should be **4 spaces** as described in the the recommended file format: [space separated format](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#space-separated-format).

## Separation

* **Separator** >= 4 spaces represented by `····` in the following examples. 

Separation thus is the vertical space between tokens, where tokens are any keywords, variables, constructs.

```robot
*** Test Cases ***
My Test
    Keyword One····argument1····argument2
```

## Indentation

* **Indentation** n time 4 spaces (where n is the level of indentation and n never exceeds 5, hence nesting depth cannot exceed 4)

Steps in a Keyword

*Example with additional vertical lines for visual clearification: where n == 4 because the keyword also counts in the nesting.*

```
*** Keywords ***
My Nested Keyword
|····FOR    ${i}    IN RANGE    10
|····|····IF    $i % 2
|····|····|····IF   $i > 5
|····|····|····|····Log    Odd number over 5: ${i}
|····|····|····END  |
|····|····END  |    |
|····END  |    |    |
|    |    |    |    |
0    1    2    3    4
```


  - Space between Vars and = ? (and whether to use "=" at all)
- Indentation of Blocks
  - High Level Blocks = Required indention of Keywords within Test Cases

## Line Continuation

[look over there](./line_continuation.md)

## Line Length

A line length of 120 characters is recommended. [Robocop: #line-too-long](https://robocop.readthedocs.io/en/stable/rules.html#line-too-long)

## Trailing whitespaces

Trailing whitespaces should be avoided. [Robocop: #trailing-whitespace](https://robocop.readthedocs.io/en/stable/rules.html#trailing-whitespace)

## Indentation in Settings Section

Indentations should only be added when needed.

The `*** Settings ***` section should always be left aligned without any indentation [Robocop: #suite-setting-should-be-left-aligned](https://robocop.readthedocs.io/en/stable/rules.html#suite-setting-should-be-left-aligned)

```robot
*** Settings ***
Library      Collections
Resource     data.resource
Variables    vars.robot
```

## Indentation in Variables Section

The `*** Variables ***` secion should always be left aligned without any indentation [Robocop: #variable-should-be-left-aligned](https://robocop.readthedocs.io/en/stable/rules.html#variable-should-be-left-aligned)

```robot
*** Variables ***
${VAR}     my variable
${VAR2}    2
```

## Separation in Settings Section

Arguments to settings should be aligned according to the longest setting added with 4 spaces. [Robotidy: #alignsettingssection](https://robotidy.readthedocs.io/en/stable/transformers/AlignSettingsSection.html#alignsettingssection)

Arguments to Libraries should be aligned if there are multiple libraries that have arguments on importing.
After the first argument to libraries all other arguments should either:
* be separated with 4 spaces
* be aligned in colums

#### Separated with 4 spaces

```robot
*** Settings ***
Library       String
Library       DataDriver    my_data_file.csv    dialect=UserDefined    delimiter=.  
Library       Telnet    timeout=3s    newline=CLRF    encoding=UTF-8
Resource      ${resourcedir}/mykeywords.resource
Resource      ${resourcedir}/myotherkeywords.resource
Test Tags     mytag
```

#### Aligned in columns

```robot
*** Settings ***
Library       String
Library       DataDriver    my_data_file.csv    dialect=UserDefined    delimiter=.  
Library       Telnet        timeout=3s          newline=CLRF           encoding=UTF-8
Resource      ${resourcedir}/mykeywords.resource
Resource      ${resourcedir}/myotherkeywords.resource
Test Tags     mytag
```

## Indentation in Test Cases, Tasks and Keywords

The test case, task and keyword names should always start at the first character on a line. Test steps, task steps and keywords called from within keyword should be indented.

``` robot
*** Test Cases ***
My First Test Case
    Test Step One
    ${myvar}    Test Step Two That Returns A Value
```

``` robot
*** Tasks ***
My First Task
    Task Step One
    ${myvar}    Task Step Two That Returns A Value
```

``` robot
*** Keywords ***
Test Step One
    Some Keywords Being Called
    Log    Some Message

Test Step Two That Returns A Value
    RETURN  some string
```

## Block Indentation

Blocks like `IF`, `WHILE`, `FOR` and `TRY/EXCEPT` should always be indented such that the keywords that are run within the loop have to be indented from the lines that start and end the block. [Robocop: #bad-indent](https://robocop.readthedocs.io/en/stable/rules.html#bad-indent)

### Examples from the User Guide


[IF/ELSE](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#if-else-syntax)

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

[WHILE](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#while-loops)

```robot
*** Test Cases ***
Limit as iteration count
    WHILE    True    limit=100
        Log    This is run 100 times.
    END
```

[FOR](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#for-loops)

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

[TRY/EXCEPT](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#try-except-syntax)

```robot
*** Test Cases ***
First example
    TRY
        Some Keyword
    EXCEPT    Error message
        Error Handler Keyword
    END
    Keyword Outside
```

## Comments

In comments there should be a space between the `#` and the actual comment. [Robocop: #missing-space-after-comment](https://robocop.readthedocs.io/en/stable/rules.html#missing-space-after-comment)

Comments should be avoided, write your code readable or use the `[Documentation]`.
The only valid use of comments is for TODO's that should be fixed soon.

If you use comments:
* Comments should be aligned with the block they belong to.
* Inline comments have one indentation before the `#`

```robot
# Comment about Some Keyword here
Some Keyword
    Called Keyword One
    # Comment about Called Keyword Two here
    Called Keyword Two    # TODO fix weird behaviour.
```
