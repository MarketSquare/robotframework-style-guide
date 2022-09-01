## Documentation




Examples
Arguments (and explanations)
Return values
Accessing Global variables

### Documentation of TestSuites
### Documentation of Resources


### Documentation of Keywords
The following guidelines are providing for different ways of reading the documentation.

1. Online documentation created via LibDoc
2. Popup documentation in an IDE when using keywords
3. Written documentation for use when making changes to the keyword


Arguments in documentation is taken from the tag `[Arguments]` and only needs to be described in detail if the arguments are not selfexplanatory.

Documentation is everything within the tag `[Documentation]` and is split up in different sections.

* A single line short description of what the keyword does.
* A Precondition if needed for this keyword to work.
* Explanation of the arguments
* Accessing / Setting Global variables
* Return value(s)
* Example usage

#### Arguments

Example robotframework syntax
```
Verify Message
    [Documentation]
    ...    This keyword verifies a message.
    ...
    ...    *Precondition:*
    ...    Go to Screen Home > Subpage One > Screen Two.

    ...    *Examples*
    ...
    ...    ``Verify Message \ \ \ \ message=Data Saved``
    [Arguments]    ${message}

    SeleniumLibrary.Element Should Be Visible    //*[contains(text(),'${message}')]    Message Not Present
```

