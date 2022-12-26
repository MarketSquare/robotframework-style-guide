# Vertical Order

Recommended approaches to ordering .robot and .resource files.

## Section Order

User Guide Reference: <https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-data-sections>

```robot
*** Settings ***

*** Variables ***

*** Test Cases / Tasks ***

*** Keywords ***

*** Comments ***

```

## Settings Section Order

User Guide Reference: <https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#setting-section-1>

```robot
*** Settings ***
Documentation
Library    BuiltIn
Library    3rd Party
Library    Custom
Resource
Variables
Metadata
Suite Setup
Suite Teardown
Test/Task Tags
Test/Task Setup
Test/Task Teardown
Test/Task Template
Test/Task Timeout
```

## Variables Section Order

```robot
*** Variables ***

```

## Test Case / Task Section Order

User Guide Reference: <https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-case-section>

```robot
Test Case
    [Documentation]
    [Tags]
    [Setup]
    [Teardown]
    [Template]
    [Timeout]
    Static Variable Assignments
    Keyword Calls
    Verification Keyword Call
```

## Keyword Section Order

User Guide Reference: <https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#keyword-section-1>

```robot
Keyword
    [Documentation]
    [Tags]
    [Arguments]
    [Return]
    [Teardown]
    [Timeout]
    Static Variable Assignments
    Keyword Calls
```
