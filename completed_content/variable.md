import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

## Variables

Recommended methods of using and naming variables

Variables are the life blood of Robot Framework's flexibility.

Understanding variable scope and proper naming are important for managing them in a project.

This is also an area where you will need to understand the stakeholders involved in the project.

If your project participants are less technical more syntactic sugar may be necessary than if a project is managed mostly by more technical roles (developers, devops, etc...) then more code-like syntax might be better.

***In either case choose the style that best fits your project and keep to that decision.***

---

### Variable Scope And Casing

Adhering to casing rules provides a convenient way of identifying the scope of a variable.

- Variable Syntax from the user guide [variable-priorities-and-scopes](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variable-priorities-and-scopes)

| Variable Scope                               | Syntax                               |
|----------------------------------------------|:------------------------------------:|
|**GLOBAL** variables use upper-case letters.  | `${UPPER CASED}` or `${UPPER_CASED}` |
|**SUITE** variables use upper-case letters.   | `${UPPER CASED}` or `${UPPER_CASED}` |
|**TEST** variables use upper-case letters.    | `${UPPER CASED}` or `${UPPER_CASED}` |
|**LOCAL** variables use lower-case letters.   | `${lower cased}` or `${lower_cased}` |
|Keyword arguments use lower-case letters.     | `${lower cased}` or `${lower_cased}` |

#### Declaring Variable Scope Properly

It is advised to not reuse GLOBAL or SUITE variable names in lower scoped contexts.

*Example:*

Robot Framework ignores casing therefore `${I AM A VARIABLE}` is the same as `${i am a variable}`.

```robot
*** Variables ***
${I AM A VARIABLE}    This is a SUITE scoped variables


*** Test Cases ***
Variable Casing Test
    [Documentation]    Robot Framework ignores casing.
    Log To Console    ${I AM A VARIABLE}
    Should Be Equal     ${I AM A VARIABLE}    ${i am a variable}

Same Variable Different Scope Test
    [Documentation]    The SUITE variable is overwritten by an argument then TEST scoped variable of same name.
    A Keyword With Arguments    This will be printed.
    Should Not Be Equal     ${I AM A VARIABLE}    This is a SUITE scoped variables 


*** Keywords ***
A Keyword With Arguments
    [Documentation]    The argument will take precedence then the SUITE level variable will be overwritten by a TEST scope variable.
    [Arguments]    ${i am a variable}
    Log To Console    ${i am a variable}
    Set Test Variable    ${i am a variable}
```

---

### Variable Assignment Syntax

There are two favored syntaxes for assigning a value to a variable:

<Tabs>
  <TabItem value="By Spacing Only" label="Style 1">

```robot
*** Variables ***
${VARIABLE}    value


*** Keywords ***
Variable Keyword
  ${variable}    Set Variable    value
  Log To Console    ${variable}
```

  </TabItem>
  <TabItem value="By '=' sign (syntactic sugar method)" label="Style 2">

```robot
*** Variables ***
${VARIABLE} =    Value


*** Keywords ***
Variable Keyword
  ${variable} =    Set Variable    Value
  Log To Console    ${variable}
```

  </TabItem>
</Tabs>

If you prefer using equals ('=') signs, then be sure that it is formatted `${var}·=····` where each `·` is a space.
The reason for a space immediately after a variable is to make the variable more readable.

```robot
*** Keywords ***
Setting Variables
    ${var}·=····Set Variable    good
    ${var}=····Set Variable    not great, but seen commonly
```

```robot
*** Keywords ***
Never Like This Ever
    [Documentation]    You will throw a syntax error!
    ${var}··=····Set Variable    do not do this
```

---

### Spaces Or Underscores Variables

Referring back to who will be involved with reading and understanding test cases, it may be best to use spaces instead of underscores.

In the user guide there are existing examples of this syntax [built-in-variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#built-in-variables)

Since Robot Framework treats spaces and underscores the same and in most cases not even necessary, each of these variable names are the same:

```robot
*** Variables ***
${VARIABLE_ONE}    same
${VARIABLE ONE}    same
${VARIABLEONE}     same
```

#### Using Variables With Spaces Within Python Code Blocks

If you are using variables containing spaces within python code blocks (Inline script, Evaluate keyword, python module, etc...) replace the space with an underscore.

  ```robot
  *** Keywords ***
  Python Syntax With Underscores
      [Argument]    ${argument variable}
      ${upper value}    Evaluate    $argument_variable.upper()
      RETURN    ${upper value}
  ```

  ```robot
  *** Keywords ***
  Python Inline Syntax With Underscores
      [Argument]    ${argument variable}
      RETURN    ${{$argument_variable.upper()}}
  ```

---

### Variables Within Settings Section

Variables can be used within the settings section.

They are useful for dynamic file paths and other values.

Typically they are Suite or Global scoped variables. (i.e. Always UPPER CASED, UPPER_CASED)

It is best to define them within a Variables section of a resource or robot file, and very easy to track down.

Using a Variable that does not have a default value is a bad idea.

<Tabs>
  <TabItem value="With Spaces" label="style 1">

```robot
*** Settings ***
Resource     ${RESOURCE PATH}/Resource.resource
Variables    ${VARIABLES PATH}/Variables.yaml


*** Variables ***
${RELATIVE PATH}     ../../..
${RESOURCE PATH}     ${RELATIVE PATH}/Resources
${VARIABLES PATH}    ${RESOURCE PATH}/Variables
```

  </TabItem>
  <TabItem value="With Underscores" label="style 2">

```robot
*** Settings ***
Resource     ${RESOURCE_PATH}/Resource.resource
Variables    ${VARIABLES_PATH}/Variables.yaml


*** Variables ***
${RELATIVE_PATH}     ../../..
${RESOURCE_PATH}     ${RELATIVE_PATH}/Resources
${VARIABLES_PATH}    ${RESOURCE_PATH}/Variables
```

  </TabItem>
</Tabs>  

Consult Line Continuation in regards to how to handle the values of these types.

:::note 
You can build variables in the `Settings` or `Variable` sections from other variables the only rule is that the referenced variable has been assigned a value previously.
:::

*This will not work:*

<Tabs>
  <TabItem value="With Spaces" label="style 1">

```robot
*** Settings ***
Resource     ${RESOURCE PATH}/Resource.resource
Variables    ${VARIABLES PATH}/Variables.yaml


*** Variables ***
${RESOURCE PATH}     ${RELATIVE PATH}/Resources
${VARIABLES PATH}    ${RESOURCE PATH}/Variables
${RELATIVE PATH}     ../../..
```

  </TabItem>
   <TabItem value="With Underscores" label="style 2">

```robot
*** Settings ***
Resource     ${RESOURCE_PATH}/Resource.resource
Variables    ${VARIABLES_PATH}/Variables.yaml


*** Variables ***
${RESOURCE_PATH}     ${RELATIVE_PATH}/Resources
${VARIABLES_PATH}    ${RESOURCE_PATH}/Variables
${RELATIVE_PATH}     ../../..
```

  </TabItem>
</Tabs>  

---

### Variables Section

Variables declared within the *** Variables *** section are Suite level in scope. (i.e. Always UPPER CASED, UPPER_CASED)

Be sure to use the correct indicators of type of Variables:

- Scalar ($)
- List (@)
- Dictionary (&)

---

### Test Cases Or Tasks

Variables assigned within a test/task should be treated as Test Variables in scope. (i.e. Always UPPER CASED, UPPER_CASED)

The ocassional exception would be if there are FOR LOOP or WHILE LOOP structures then in those cases it would be acceptable.

*FOR LOOP and WHILE LOOP structures should be avoided in test cases.*

---

### Keywords

A majority of Keyword level variables will be local variables (i.e. lower cased, lower_cased).
But other scopes can be assigned using `BuildIn keywords`, make sure you case variables according to how they are assigned.

<Tabs>
  <TabItem value="With Spaces" label="style 1">

```robot
*** Keywords ***
A Keyword of Variables
    [Documentation]     This keyword will create these variables:
    ...    ${TEST VARIABLE}
    ...    ${SUITE VARIABLE}
    ...    ${GLOBAL VARIABLE}
    [Arguments]    ${this is an argument}
    Set Local Variable            ${local variable}    use lower case
    ${assigned local variable}    Set Variable         use lower case also
    Set Test Variable             ${TEST VARIABLE}     USE UPPER CASE
    Set Suite Variable            ${SUITE VARIABLE}    USE UPPER CASE
    ${GLOBAL VARIABLE}            Create List          BETTER    USE    UPPER    CASE
    Set Global Variable           ${GLOBAL VARIABLE}
```

  </TabItem>
    <TabItem value="With Underscores" label="style 2">

```robot
*** Keywords ***
A Keyword of Variables
    [Documentation]     This keyword will create these variables:
    ...    ${TEST_VARIABLE}
    ...    ${SUITE_VARIABLE}
    ...    ${GLOBAL_VARIABLE}
    [Arguments]    ${this_is_an_argument}
    Set Local Variable            ${local_variable}    use lower case
    ${assigned_local_variable}    Set Variable         use lower case also
    Set Test Variable             ${TEST_VARIABLE}     USE UPPER CASE
    Set Suite Variable            ${SUITE_VARIABLE}    USE UPPER CASE
    ${GLOBAL_VARIABLE}            Create List          BETTER    USE    UPPER    CASE
    Set Global Variable           ${GLOBAL_VARIABLE}
```

  </TabItem>
</Tabs>  

Treat keyword arguments as local variables for naming purposes.

If setting Suite and Global Variables within keywords from resource files.
Setting Test Variables should be reserved to test cases if at all possible.
In either case document non-local scoped variables.

---

### Variable Files

Assume variables declared within variable files to be at minimum SUITE in scope. (i.e. Always UPPER CASED, UPPER_CASED)

The examples given are using variables with spaces.

#### .resource Variable Files

Assume variables declared within the Variable section of a resource files to be at minimum SUITE in scope. (i.e. Always UPPER CASED, UPPER_CASED)

```robot
*** Variables ***
${STRING VARIABLE}    Hello I am a resource variable.
${INT VARIABLE}       ${42}
@{LIST VARIABLE}      one    two
&{DICT VARIABLE}      one=yksi    two=kaksi    with spaces=kolme
```

#### Python Variable Files

Assume variables declared within python variable files to be at minimum SUITE in scope. (i.e. Always UPPER CASED, UPPER_CASED)

Note that syntactically you cannot declare python variables with a space, but when you use them in Robot Framework you can use a space.

Python libraries that declare variables are handled according to use case.

```python
STRING_VARIABLE = "Hello I am a python variable."
INT_VARIABLE = 42
LIST_VARIABLE = ["one", "two"]
DICT_VARIABLE = {"one": "yksi", "two": "kaksi", "with spaces": "kolme"}
```

#### Yaml Variable Files

Assume variables declared within yaml variable files to be at minimum SUITE in scope. (i.e. Always UPPER CASED, UPPER_CASED)

When using a Yaml file you should follow Yaml Specifications for the key and value formatting.

As with python variables when you use them in Robot Framework you can use a space.

```yaml
STRING VARIABLE: Hello I am a yaml variable.
INT VARIABLE: 42
LIST VARIABLE:
  - one
  - two
DICT VARIABLE:
  one: yksi
  two: kaksi
  with spaces: kolme
```

#### Json Variable Files

Assume variables declared within json variable files to be at minimum SUITE in scope. (i.e. Always UPPER CASED, UPPER_CASED)

```json
{
    "STRING VARIABLE": "Hello I am a json variable.",
    "INTEGER VARIABLE": 42,
    "LIST VARIABLE": [
        "one",
        "two"
    ],
    "DICT VARIABLE": {
        "one": "yksi",
        "two": "kaksi",
        "with spaces": "kolme"
    }
}
```

---

### Special Cases

#### Commandline Variables

Commandline Variables and by extension variable files should be treated as Global Variables. (i.e. Always UPPER CASED, UPPER_CASED)

#### Environment Variables

<https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#environment-variables>

Environment Variables should be treated as Global Variables. (i.e. Always UPPER CASED, UPPER_CASED)

It is also possible that the variable casing needs to match how the variable has been declared outside of Robot Framework's context.

#### Deviation When Context Is More Important

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
<Tabs>
  <TabItem value="Using normal variable syntax" label="style 1">

```robot
*** Keywords ***
Create Json Body Option One
  [Documentation]    This one is an 'OK' example.
  [Arguments]    ${first name}    ${last name}
  ${json body}    Create Dictionary    firstName=${first name}    lastName=${last name}
  RETURN    ${json body}
```

  </TabItem>
  <TabItem value="Matching variables to Json keys" label="style 2">

```robot
*** Keywords ***
Create Json Body Option Two
  [Documentation]   This is also an 'OK' example.
  [Arguments]    ${firstName}    ${lastName}
  ${json body}    Create Dictionary    firstName=${firstName}    lastName=${lastName}
  RETURN    ${json body}
```

  </TabItem>
</Tabs>  

#### Embedded Variables

[variables-inside-variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variables-inside-variables)

Be careful to not embed more than one variable within a variable.

Keep it simple.

Readability becomes an issue with more than one embedded variable.

<Tabs>
  <TabItem  value="With Spaces" label="style 1">

```robot
*** Keywords ***
Set Suite Variables
    Set Suite Variable    ${EMBED VAR}   embedded
    Set Suite Variable    ${VARIABLE ${EMBED VAR}}    good embedded variable
    Set Suite Variable    ${FOO}    eggs
    Set Suite Variable    ${BAR}    spam  
    Set Suite Variable    ${VARIABLE ${FOO} ${BAR}}    questionable variable
    Set Suite Variable    ${VAR}    one
    Set Suite Variable    ${WITHIN ${VAR}}  two
    Set Suite Variable    ${VARIABLES ${WITHIN ${VAR}}}  three
    Set Suite Variable    ${INCEPTION ${VARIABLES ${WITHIN ${VAR}}}}  do not do this
```

  </TabItem>
  <TabItem  value="With Underscores" label="style 2">

```robot
*** Keywords ***
Set Suite Variables
    Set Suite Variable    ${EMBED_VAR}   embedded
    Set Suite Variable    ${VARIABLE_${EMBED_VAR}}    good embedded variable
    Set Suite Variable    ${FOO}    eggs
    Set Suite Variable    ${BAR}    spam  
    Set Suite Variable    ${VARIABLE_${FOO}_${BAR}}    questionable variable
    Set Suite Variable    ${VAR}    one
    Set Suite Variable    ${WITHIN_${VAR}}  two
    Set Suite Variable    ${VARIABLES_${WITHIN_${VAR}}}  three
    Set Suite Variable    ${INCEPTION_${VARIABLES_${WITHIN_${VAR}}}}  do not do this
```

  </TabItem>
</Tabs>  

#### Variables with Attributes

[extended-variable-assignment](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#extended-variable-assignment)

Attributes to variables can be any casing and usually follow the use case.
The variable itself should follow the casing rules of its scope.

```robot
Attribute Variables
    ${local variable.name}    Set Variable              this is a variable
    ${local variable.foo}     Set Variable              this is an local attribute
    Set Suite Variable        ${SUITE VARIABLE.name}    this is a suite variable
    ${SUITE VARIABLE.bar}     Set Variable              this is an suite attribute
```
