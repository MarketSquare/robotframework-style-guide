*** Comments ***
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#nested-if-structures

*** Keywords ***
Log items
    [Arguments]    @{items}    ${log_values}=True
    IF    not ${items}
        Log to console    No items.
    ELSE IF    len(${items}) == 1
        IF    ${log_values}
            Log to console    One item: ${items}[0]
        ELSE
            Log to console    One item.
        END
    ELSE
        Log to console    ${{len(${items})}} items.
        IF    ${log_values}
            FOR    ${index}    ${item}    IN ENUMERATE    @{items}    start=1
                Log to console    Item ${index}: ${item}
            END
        END
    END

*** Test Cases ***
No items
    Log items

One item without logging value
    Log items    xxx    log_values=False

Multiple items
    Log items    a    b    c