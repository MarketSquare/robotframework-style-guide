*** Comments ***
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-case-name-and-documentation


*** Test Cases ***
Simple
    [Documentation]    Simple and short documentation.
    No Operation

Multiple lines
    [Documentation]    First row of the documentation.
    ...
    ...                Documentation continues here. These rows form
    ...                a paragraph when shown in HTML outputs.
    No Operation

Formatting
    [Documentation]
    ...    This list has:
    ...    - *bold*
    ...    - _italics_
    ...    - link: http://robotframework.org
    No Operation

Variables
    [Documentation]    Executed at ${HOST} by ${USER}
    No Operation