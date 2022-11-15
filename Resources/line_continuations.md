# Line Continuations

Line continuation character in Robot Framework is ellipsis: (`...`).

For more details, please refer to the [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#dividing-data-to-several-rows).

## Variables

It is reasonable to split a variable definition across multiple lines when it exceeds the recommended line length,
or for the better readability of the code.

Below are examples for the different variable types in different sections of the test and resources files.

&nbsp;

### **Variables Section**

- Line continuation character (`...`) should be placed at the beginning of the new row,
that is, not at the end of the previous row.
- No empty continuation lines (lines containing only `...`)
- Every new continuation line should be aligned with the previous line
- Continuation line should not be indented

&nbsp;

EXAMPLES

#### **Scalars**

Scalar variable in `Variables` section on a single line:

```robot
*** Variables ***
${STRING}    This string has multiple sentences. They are all on the same line. It may not look nice in the code because the line is too long.
```

Scalar variable in `Variables` section split into several lines:

```robot
*** Variables ***
${STRING}    This string has multiple sentences.
...          They were all on the same line.
...          It did not look nice in the code
...          because the line was too long.
...          Now it is split in rows.
```

Mix of line continuation and a new line (note use of newline character `\n`):

```robot
*** Variables ***
${STRING}    This string has multiple sentences.
...          This sentence will be printed on the same row
...          in the HTML test log.
...          And this line too.
...          Next line will be printed \n
...          on a new row.
```

#### **Lists**

List variable in `Variables` section on a single line:

```robot
*** Variables ***
@{LIST}    apple    banana    peach    grape    avocado    kiwi    some very long name of the fruit which exceeds the recommended line length
```

List variable in `Variables` section split into several lines:

```robot
*** Variables ***
@{LIST}      apple    banana    peach
...          grape    avocado    kiwi
...          some very long name of the fruit which exceeds the recommended line length

----------------- OR (??) ---------------

@{LIST}      apple
...          banana
...          peach
...          grape
...          avocado
...          kiwi
...          some very long name of the fruit which exceeds the recommended line length
```

Please note that the item values of the iterable cannot be split using line continuation character. Therefore,
it is not possible to divide the last item in the above example with the ellipses (`...`.)

In this case, it is recommended (**is it???**) to define the item separately:

```robot
*** Variables ***
${LONG_ITEM}    some very long name of the
...             fruit which exceeds
...             the recommended line length

@{LIST}         apple    banana    peach
...             grape    avocado    kiwi
...             $(LONG_ITEM)
```

#### **Dictionaries**

Dictionary variable in `Variables` section on a single line:

```robot
*** Variables ***
&{DICT}    name=robot    age=14    ccupation=framework    version=latest    address=https://robotframework.org/    documentation=This text is so long it cannot be fit on one line
```

Dictionary variable in `Variables` section  split into several lines:

```robot
*** Variables ***
&{DICT}    name=robot    age=14    occupation=framework
...        version=latest    address=https://robotframework.org/
...        documentation=This text is so long it cannot be fit on one line

----------------- OR (??) ---------------

&{DICT}    name=robot
...        age=14
...        occupation=framework
...        version=latest
...        address=https://robotframework.org/
...        documentation=This text is so long it cannot be fit on one line
```

Similarly to the list items, a key-value pair of the dictionary cannot be split using the line continuation character.

In this case, it is recommended (**is it???**) to define the value separately:

```robot
*** Variables ***
${LONG_VALUE}    This text is so long
...              it cannot be fit on one line

&{DICT}          name=robot
...              age=14
...              occupation=framework
...              version=latest
...              address=https://robotframework.org/
...              documentation=${LONG_VALUE}
```

&nbsp;

TO DO:

- ### **Long Variables in Test Keywords**

- ### **Long Variables in Test Cases**
