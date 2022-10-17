# Line Continuations

Line continuation character in Robot Framework is ellipsis: (`...`).
Read more at: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#dividing-data-to-several-rows

...

## Variables

It is recommended to split a variable definition across multiple lines when it exceeds the recommended line length, or readeability of the code suffers.

It is recommended that beginning of each line is aligned vertically as shown in the examples below.

&nbsp;

### Scalar Variables

&nbsp;

#### **Example - Long Variable in Variables Section**

Variable definition on a single line:

```text
*** Variable ***
${STRING}          This string has multiple sentences. It has no newlines. It may not look nice in the code because the line is too long.
```

Variable definition split into several lines:

```text
*** Variable ***
${STRING}    This string has multiple sentences.
...          It has no newlines.
...          It does not look nice in the code
...          because the line is too long.
```

If the the value of this variable is printed in the test log, it will still appear on a single line.

To print each part of a string on a new line, then `SEPARATOR` should be used:

```text
*** Variable ***
${MULTILINE}    SEPARATOR=\n
...             This is a multiline string.
...             This is the second line.
...             This is the third and the last line.
```

TO DO:

#### **Example - Example - Long Variable in Keywords**

#### **Example - xample - Long Variable in Test Cases**
