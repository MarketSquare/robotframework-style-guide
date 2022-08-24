## Documentation




### Documentation of Keywords

Example robotframework syntax
```
Verify Message
    [Documentation]
    ...    This keyword verifies a message.
    ...
    ...    *Precondition:*
    ...    Go to Screen Home > Subpage One > Screen Two.
    ...    *Parameters:*
    ...    | =Parameter=    | =GUI=      | =Description=                | =Example=             |
    ...    | ``Message``    | message    |    Message to be verified    | message=Data Saved    |
    ...
    ...    *Examples*
    ...
    ...    ``Verify Message \ \ \ \ message=Data Saved``
    [Arguments]    ${message}

    Take Screenshot    message
    SeleniumLibrary.Element Should Be Visible    //*[contains(text(),'${message}')]    Message Not Present
```
Example docstring syntax



Example reStructuredText syntax

