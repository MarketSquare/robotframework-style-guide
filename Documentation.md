## Documentation


### Documentation of TestSuites

### Documentation of Resources

### Documentation of Keywords
The following guidelines are providing for different ways of reading the documentation.

1. Online documentation created via LibDoc
2. Popup documentation in an IDE when using keywords
3. Written documentation for use when making changes to the keyword

Arguments in documentation is taken from the tag `[Arguments]` and only needs to be mentioned in de `[Documentation]` if the arguments are not selfexplanatory.

Documentation is everything within the tag `[Documentation]` and is split up in different sections.

* A single line short description of what the keyword does.
* Full description
* A Precondition if needed for this keyword to work.
* Explanation of the arguments
* Accessing / Setting Global variables
* Return value(s)
* Example usage (always in a codeblock)

#### Arguments

Example robotframework syntax
```
Validate Message
    [Documentation]
    ...    Validates found message against `variable`.
    ...
    ...    This keyword validates a message against an expected message given as an argument. 
    ...    The message to check is case sensitive.
    ...
    ...    *Precondition:*
    ...    Go to Screen Home > Subpage One > Screen Two.
    ...
    ...    *Arguments*
    ...    `Message`  <string> to validate 
    ...
    ...    *Examples*
    ...
    ...    ``Validate Message \ \ \ \ message=Data Saved``
    [Arguments]    ${message}

    Some code
```

