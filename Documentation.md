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
Keyword With Arguments
    [Documentation]  This keyword does things
    ...
    ...    This keyword does things with arguments and returns the result.
    ...    It does it by using the first argument such that it converts that
    ...    combined with the second arguments into a string that is being returned.
    ...
    ...    *Precondition:*
    ...
    ...    The following things should be done before this keyword can be used.
    ...
    ...    *Arguments*
    ...    - `first argument` <int>  Number of somethings
    ...    - `second argument` <string> Name of something
    ...    
    ...    *Examples*
    ...
    ...    ``Keyword With Arguments\ \ \ \ 3
    ...      Keyword With Arguments\ \ \ \ 1\ \ \ \ Pear``
    [Tags]    tag1  tag2
    [Arguments]    ${first argument}   ${second argument}=Apple
    
        Some code
```

