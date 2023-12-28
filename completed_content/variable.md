# Variables

Recommended methods of using and naming variables

Variables are the life blood of Robot Framework's flexibility.

Understanding variable scope and proper naming are important for managing them in a project.

This is also an area where you will need to understand the stakeholders involved in the project.

If your project participants are less technical more syntactic sugar may be necessary than if a project is managed mostly by more technical roles (developers, devops, etc...) then more code-like syntax might be better.

***In either case choose the style that best fits your project and keep to that decision.***

---

## Variable Scope And Casing

Adhering to casing rules provides a convenient way of identifying the scope of a variable.

- Variable Syntax from the user guide [variable-priorities-and-scopes](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variable-priorities-and-scopes)

  - Global variables use upper-case letters.
  - Suite variables use upper-case letters.
  - Test variables use upper-case letters.
  - Local variables use lower-case letters.
  - Keyword arguments use lower-case letters.

### Deviation When Context Is More Important

Sometimes variables should mimic the parameters of an API. This is especially true when interacting with REST API json bodies.

You have a couple of choices:

*Given this example body:*

```json
{
  "firstName": "value",
  "lastName": "value"
}
```

*Then choose either:*

```robot
Create Json Body Option One
  [Documentation]    This one is an 'OK' example.
  [Arguments]    ${first_name}    ${last_name}
  ${json_body}    Create Dictionary    firstName=${first_name}    lastName=${last_name}
  RETURN    ${json_body}
```

*Or:*

```robot
Create Json Body Option Two
  [Documentation]   This is also an 'OK' example.
  [Arguments]    ${firstName}    ${lastName}
  ${json_body}    Create Dictionary    firstName=${firstName}    lastName=${lastName}
  RETURN    ${json_body}
```

## Variable Assignment Syntax

There are two favored syntaxes for assigning a value to a variable:

1. By spacing only

    ```Robot
    *** Variables ***
    ${VARIABLE}    value


    *** Keywords ***
    Variable Keyword
      ${variable}    Set Variable    value
      Log To Console    ${variable}
    ```

2. By '=' sign (syntactic sugar method)

    ```Robot
    *** Variables ***
    ${VARIABLE} =    Value


    *** Keywords ***
    Variable Keyword
      ${variable} =    Set Variable    Value
      Log To Console    ${variable}
    ```

If you prefer option 2. then be sure that it is formatted `${var}·=····` where each `·` is a space.
The reason for a space immediately after a variable is to make the variable more readable.

```robot
${var} =    Set Variable    good
${var}=    Set Variable    not great, but seen commonly
${var}  =    Set Variable    do not do this
```

## Spaces Within Variables

Referring back to who will be involved with reading and understanding test cases, it may be best to use spaces instead of underscores.

In the user guide there are existing examples of this syntax [built-in-variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#built-in-variables)

Since Robot Framework treats spaces and underscores the same and in most cases not even necessary, each of these variable names are the same:

```robot
*** Variables ***
${VARIABLE_ONE}    same
${VARIABLE ONE}    same
${VARIABLEONE}    same
```

### Using Variables With Spaces Within Python

If you are using variables containing spaces within python code blocks (inline script, Evaluate keyword, python module, etc...) either:

1. Replace the space with an underscore.

    ```robot
    Python Syntax With Underscores
        [Argument]    ${argument variable}
        ${upper value}    Evaluate    $argument_variable.upper()
        RETURN    ${{upper_value.lower()}}
    ```

2. Remove the space.

    ```robot
    Python Syntax Without Underscores
        [Argument]    ${argument variable}
        ${upper value}    Evaluate    $argumentvariable.upper()
        RETURN    ${{uppervalue.lower()}}
    ```

## Variables Within Settings Section

Variables can be used within the settings section.
They are useful for dynamic file paths and other values.
Typically they are Suite or Global scoped variables. (i.e. Always UPPER_CASED)
It is best to define them within a Variables section of a resource or robot file, and very easy to track down.
Using a Variable that does not have a default value is a bad idea.

```robot
*** Settings ***
Resource     ${RESOURCE_PATH}/Resource.resource
Variables    ${VARIABLES_PATH}/Variables.yaml


*** Variables ***
${RELATIVE_PATH}     ../../..
${RESOURCE_PATH}     ${RELATIVE_PATH}/Resources
${VARIABLES_PATH}    ${RESOURCE_PATH}/Variables
```

## Variables Within Variable Section

Variables within a Variables section will at least be Suite or Global in scope. (i.e. Always UPPER_CASED)
Be sure to use the correct indicators of type of Variables:

- Scalar ($)
- List (@)
- Dictionary (&)

Consult Line Continuation in regards to how to handle the values of these types.

Note you can build variables in this section from other variables the only rule is that the referenced variable has been assigned a value previously.

*This will not work:*

```robot
*** Settings ***
Resource     ${RESOURCE_PATH}/Resource.resource
Variables    ${VARIABLES_PATH}/Variables.yaml


*** Variables ***
${RESOURCE_PATH}     ${RELATIVE_PATH}/Resources
${VARIABLES_PATH}    ${RESOURCE_PATH}/Variables
${RELATIVE_PATH}     ../../..
```

## Variables Within Keywords

A majority of Keyword level variables will be local variables (i.e. lower_cased)
Case variables according to how they are assigned.

```robot
A Keyword of Variables
    [Documentation]     This keyword will create these variables:
    ...    ${TEST_VARIABLE}
    ...    ${SUITE_VARIABLE}
    ...    ${GLOBAL_VARIABLE}
    Set Local Variable    ${local_variable}    use lower case
    ${assigned_local_variable}    Set Variable    use lower case also
    Set Test Variable    ${TEST_VARIABLE}    USE UPPER CASE
    Set Suite Variable    ${SUITE_VARIABLE}    USE UPPER CASE
    ${GLOBAL_VARIABLE}    Create List    BETTER    USE    UPPER    CASE
    Set Global Variable    ${GLOBAL_VARIABLE}
```

Treat keyword arguments as local variables.

If setting Suite and Global Variables within keywords from resource files.
Setting Test Variables should be reserved to test cases if at all possible.
In either case document non-local sccoped variables.

## Variables Within Tests/Tasks

Variables assigned within a test/task should be treated as Test Variables in scope. (i.e. Always UPPER_CASED)

The ocassional exception would be if there are FOR LOOP or WHILE LOOP structures then in those cases it would be acceptable.

*FOR LOOP and WHILE LOOP structures should be avoided in test cases.*

## Variable Files

Assume variables declared within variable files to be at minimum SUITE in scope. (i.e. Always UPPER_CASED)

### .resource Variable Files

Assume variables declared within the Variable section of a resource files to be at minimum SUITE in scope. (i.e. Always UPPER_CASED)

### Python Variable Files

Assume variables declared within python variable files to be at minimum SUITE in scope. (i.e. Always UPPER_CASED)

Python libraries that declare variables are handled according to use case.

### Yaml Variable Files

Assume variables declared within yaml variable files to be at minimum SUITE in scope. (i.e. Always UPPER_CASED)

### Json Variable Files

Assume variables declared within json variable files to be at minimum SUITE in scope. (i.e. Always UPPER_CASED)

---

## Special Variable Cases

### Variables with Attributes

[extended-variable-assignment](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#extended-variable-assignment)

Attributes to variables can be any casing and usually follow the use case.
The variable itself should follow the casing rules of its scope.

```robot
${local_variable.name}    Set Variable    this is a variable
${local_variable.foo}    Set Variable   this is an local attribute
Set Suite Variable    ${SUITE_VARIABLE.name}    this is a suite variable
${SUITE_VARIABLE.bar}    Set Variable    this is an suite attribute
```

### Embedded Variables

[variables-inside-variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variables-inside-variables)

Be careful to not embed more than one variable within a variable.
Readability becomes an issue.

```robot
Set Suite Variables
    Set Suite Variable    ${EMBED_VAR}   embedded
    Set Suite Variable    ${VARIABLE_${EMBED_VAR}}    good embedded variable
    Set Suite Variable    ${FOO}    eggs
    Set Suite Variable    ${BAR}    spam  
    Set Suite Variable    ${VARIABLE_${FOO}_${BAR}}    questionable variable
    Set Suite Variable    ${VAR_ONE}  one
    Set Suite Variable    ${WITHIN_${VAR_ONE}}  two
    Set Suite Variable    ${VARIBLES_${WITHIN_${VAR_ONE}}}  three
    Set Suite Variable    ${INCEPTION_${VARIBLES_${WITHIN_${VAR_ONE}}}}  do not do this
```

### Commandline Variables

Commandline Variables and by extension variable files should be treated as Global Variables. (i.e. Always UPPER_CASED)

### Environment Variables

<https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#environment-variables>

Environment Variables should be treated as Global Variables. (i.e. Always UPPER_CASED)

It is also possible that the variable casing needs to match how the variable has been declared outside of Robot Framework's context.

### Inline Python Evaluation

<https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#inline-python-evaluation-1>
