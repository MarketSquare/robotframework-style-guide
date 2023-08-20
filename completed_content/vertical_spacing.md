# Vertical White Space

These are the recommended vertical space guidelines for .robot and .resource files.

- The guidelines of larger sections will supercede the guidelines of the subsections.
- Vertical White Space
: Any line that contains no characters.
- Commented lines are not considered white space.

---

## Spacing after the Section Header line

There should be no space immediately after each section header line.

---

## Spacing After Sections

There should be 2 lines of white space after the last line of each section, except the last section of the file.

The last section of a file should have 1 line of white space.

---

### Example of Section Header and Section Spacing

```robot
    *** Comments ***
    Comments


    *** Settings ***
    Documentation


    *** Variables ***
    ${VARIABLE}    a variable


    *** Test Cases ***
    Test Case


    *** Tasks ***
    Task


    *** Keywords ***
    Keyword 

```

---

## Spacing After Keywords

There should be 1 line of white space after the last line in a keyword code block.

---

## Spacing Between Keyword Calls

In most cases there should be no white space between keyword calls.

---

## Spacing Between Code Blocks Within Keyword Calls

Ocassionally keywords can be grouped in subsections of logical code blocks. In these instances it is acceptable to have 1 space between these code blocks, but no more than 1 space.

---

## Spacing After Test Cases or Tasks

There should be 1 line of white space after each Test Case or Task.

---

## Spacing Between Code Blocks Within Test Cases or Tasks

Ocassionally Test Cases or Tasks can be grouped in subsections of logical code blocks. In these instances it is acceptable to have 1 space between these code blocks.

---

## Spacing After Templated Test Cases

There should be 1 line of white space after each Templated Test Case.

---

## Spacing Between Templated Test Case Data

No lines of white space should exist between lines of test data in Templated Tests.

## Spacing Between Settings Within The Settings Section

It is recommended to allow 1 line of white space between common lines of settings.

---

### Example of Settings Section Vertical Spacing

```robot
    *** Settings ***
    Documentation  
    Metadata 

    Library  
    Resource  
    Variables  

    Suite Setup  
    Suite Teardown  
    Test/Task Setup  
    Test/Task Teardown  
    Test/Task Template  
    Test/Task Timeout  

    Default Tags  
    Test Tags
```  

---

## Spacing Between Settings Within A Test Case or Task or Keyword

No lines of white space should exist between the settings of a Test Case or Task or Keyword.

---

## Spacing Of Line Continuations

No lines of white space should exist between lines of code using line continuation (...) syntax.

---

## Spacing Between Variables In The Variables Section

There should be no lines of white space between variables within the Variables section.

---

## Examples

Key to examples:

> ① Two spaces between sections  
② One space between Tests/Tasks  
③ No Space in the settings section of Tests/Tasks or Keywords  
④ No space after settings section of Tests/Tasks or Keywords  
⑤ No spaces between template Test/Task data lines  
⑥ One Space Between Keywords
⑦ No space between continuation lines  
⑧ One Space for separating code blocks  
⑨ One Space at the very end of the file

---

### Example Robot File Vertical White Spacing

```robot
*** Comments ***
This is the comments section
①

*** Settings ***
Documentation       This is documentation
⑦ ...               robot -d Results -i example-tag Tests

Library             Collections
Resource            ../Resources/ExampleResource.resource

Suite Setup         Suite Setup Keywords
Suite Teardown      Suite Teardown Keywords
Test Setup          Test Setup Keywords
Test Teardown       Test Teardown Keywords

Test Tags           example-tag


*** Variables ***
${EXAMPLE_SCALAR_VARIABLE}          This is a suite scope scalar variable
@{EXAMPLE_LIST_VARIABLE}            This    is    a    suite    scope    list    variable
&{EXAMPLE_DICTIONARY_VARIABLE}      This=is a
⑦ ...                               suite=scope
...                                 dictionary=variable
①

*** Test Cases ***
An Example Test Case
③   [Documentation]    Test documentation
    [Tags]    standard-example-tag
④   ${RESULT_LIST}    This Is A Complex Keyword With Sections    ${EXAMPLE_SCALAR_VARIABLE}
    Log To Console    ${RESULT_LIST}
②
A More Complex Test Case
③   [Documentation]    Test documentation
    [Tags]    standard-example-tag
    [Setup]    Set Test Variable    ${EXPECTED_LENGTH}    2
    ${IS_LARGER_THAN_FOUR}    Create List
⑧
    # Adding vertical white space can be used to separate test code blocks
    FOR    ${item}    IN    @{EXAMPLE_LIST_VARIABLE}
        IF    len($item)> 4
            This Is A Complex Keyword With Sections    ${item}
            Append To List    ${IS_LARGER_THAN_FOUR}    ${item}
        END
    END
    Length Should Be    ${IS_LARGER_THAN_FOUR}    ${EXPECTED_LENGTH}
②
An Example Templated Test
③   [Documentation]    Templated test documentation.
    [Tags]    templated-example-tag
    [Template]    This Is A Complex Keyword With Sections
⑤   ${EXAMPLE_DICTIONARY_VARIABLE}[This]
    ${EXAMPLE_DICTIONARY_VARIABLE}[suite]
    ${EXAMPLE_DICTIONARY_VARIABLE}[dictionary]
①

*** Keywords ***
Suite Setup Keywords
    [Documentation]    A keyword for setting up a suite
    Log To Console    Setting up ${SUITE NAME} keywords
⑥
Suite Teardown Keywords
    [Documentation]    A keyword for tearing down a suite
    Log To Console    Tearing down suite keywords
⑥
Test Setup Keywords
    [Documentation]    A keyword for setting up a test
    Log To Console    Setting up ${TEST NAME} keywords
⑥
Test Teardown Keywords
    [Documentation]    A keyword for tearing down a test
    Log To Console    Tearing down test keywords
⑨
```

---

### Example Resource File Vertical Spacing

```robot
*** Settings ***
Documentation       Resources follow the same rules as test cases and tasks

Library             String
Library             Collections
①

*** Variables ***
${EXAMPLE_RESOURCE_SCALAR}      This is a really really really really really really really
⑦ ...                          really really really really really really really long string.
①

*** Keywords ***
A Small Keyword
    [Documentation]    Small keyword documentation.
    ${small_variable}    Catenate    SEPARATOR=    Such    a    small    keyword
    RETURN    ${small_variable}
⑥
This Is A Complex Keyword With Sections
③   [Documentation]    Complex keyword documentation.
    [Arguments]    ${an_argument}
    ${local_list}    Create List
    ${get_small_value}    A Small Keyword
    ${words}    Split String    ${get_small_value}
    FOR    ${word}    IN    @{words}
        ${characters}    Split String To Characters    ${word}
⑧
        # Insert a vertical whitespace here to separate logical sections within a keyword.
        FOR    ${character}    IN    @{characters}
            IF    $character in 'aeiou'
                Append To List    ${local_list}    ${character}_${an_argument}
            END
        END
    END
    RETURN    ${local_list}
⑨
```

---
