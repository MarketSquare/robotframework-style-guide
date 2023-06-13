# Vertical Order

Recommended approaches to ordering .robot and .resource files.

Vertical order refers to the recommended order of settings, sections, variables, keywords.

## Section Order

User Guide Reference: <https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-data-sections>

```robot
*** Comments ***


*** Settings ***


*** Variables ***


*** Test Cases / Tasks ***


*** Keywords ***


```

---

## Settings Section Order

User Guide Reference: <https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#setting-section-1>

```robot
*** Settings ***
Documentation
Metadata

Library    BuiltIn
Library    3rd Party
Library    Custom
Resource
Variables

Suite Setup
Suite Teardown
Test/Task Setup
Test/Task Teardown
Test/Task Timeout
Test/Task Template

Test/Task Tags
```

## Variables Section Order

Simple variables (scalar, list, dictionary) variables should be listed first.
Composite variables (variables composed of other variables) should be listed after simple variables.

```robot
*** Variables ***
${VARIABLE}  This is a Variable
${COMPOSITE_VARIABLES}  ${VARIABLE} with other variables.

```

## Test Case / Task Section Order

User Guide Reference: <https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-case-section>

```robot
Test Case
    [Documentation]
    [Tags]
    [Setup]
    [Template]
    [Timeout]
    Static Variable Assignments
    Keyword Calls
    Verification Keyword Call
    [Teardown]
```

## Keyword Section Order

User Guide Reference: <https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#keyword-section-1>

```robot
Keyword
    [Documentation]
    [Tags]
    [Arguments]
    [Timeout]
    Static Variable Assignments
    Keyword Calls
    [Teardown]
```

---

## Keyword Order - Best Practices

It is a good idea to put static variable assignments before keyword calls.

```robot
Keyword With Static Variables
    [Arguments]    ${argument}
    ${static_variable}    Set Variable  This is a static variable.
    Set Local Variable    ${other_static_variable}   Another way to set a static variable.
    ${dynamic_variable}    Catenate    SEPARATOR=${SPACE}    ${static_variable}    ${other_static_variable}    ${argument}
    ${another_dynamic_variable}    Evaluate    $static_variable.upper()
    Log To Console    ${dynamic_variable}
    Should Not Be Equal    ${static_variable}    ${other_static_variable} 
```

### Keyword Organization

In order to make keyword search within a resource file easier alphabetize your keywords. Some IDEs have an outline side bar (i.e. VSCode) and by alphabetizing the keywords they appear in the side menu in the same way.
