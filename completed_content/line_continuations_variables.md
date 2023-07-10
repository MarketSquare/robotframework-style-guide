# Line Continuations

## Variables

It is reasonable to split a variable definition across multiple lines when it exceeds the recommended line length,
or for the better readability of the code.

Below are examples for the different variable types in different sections of the test and resources files.

&nbsp;

### **Line Continuation for Variables in `Variables` Section**

&nbsp;

General guidelines:

- Line continuation character (`...`) should be placed at the beginning of the new row,
that is, not at the end of the previous row.
- No empty continuation lines (lines containing only `'...'`)
- Every new continuation line should be aligned with the previous line
- Continuation line should not be indented

&nbsp;

---

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
@{LONG_LIST}       apple    banana    peach    grape    avocado    kiwi    some very long name of the fruit which exceeds the recommended line length
```

It is recommended to either accomodate all items on a single line or to list each item on a new line:

```robot
*** Variables ***
@{SHORT_LIST}    apple    banana    peach    grape

@{SHORT_LIST}    apple
...              banana
...              peach
...              grape

@{LONG_LIST}     apple
...              banana
...              peach
...              grape
...              avocado
...              kiwi
...              some very long name of the fruit which exceeds the recommended line length
```

Please note that the item values of the iterable cannot be split using line continuation character. Therefore,
it is not possible to divide the last item in the above example with the ellipses (`...`.)

In this case, it is recommended to define the item separately:

```robot
*** Variables ***
${LONG_ITEM}    some very long name of the
...             fruit which exceeds
...             the recommended line length

@{LIST}         apple
...             banana
...             peach
...             grape
...             avocado
...             kiwi
...             $(LONG_ITEM)
```

#### **Dictionaries**

Dictionary variable in `Variables` section on a single line:

```robot
*** Variables ***
&{LONG_DICT}     name=robot    age=14    ccupation=framework    version=latest    address=https://robotframework.org/    documentation=This text is so long that it does not fit on one line
```

It is recommended to place all key-value pairs of a dictionary
either on a single line or each on a new line:

```robot
*** Variables ***
&{SHORT_DICT}    name=robot    age=14    ccupation=framework

&{SHORT_DICT}    name=robot
---              age=14
...              occupation=framework

&{LONG_DICT}     name=robot
---              age=14
...              occupation=framework
...              version=latest
...              address=https://robotframework.org/
...              documentation=This text is so long that it does not fit on one line
```

Similarly to the list items, a key-value pair of the dictionary cannot be split using the line continuation character. In this case, it is recommended to define the value separately:

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

### **Line Continuation for Variables in `Keywords` section**

&nbsp;

General guidelines:

- Line continuation character (`...`) should be placed at the beginning of the new row,
that is, not at the end of the previous row.
- No empty continuation lines (lines containing only `...`).
- For every variable definition containing keywords (e.g., `Set Variable`, `Catenate`, `Create Dictionary`),
continuation line should be aligned with the beginning of the first item for the iterables, and with the value
definition for scalars.
- Continuation line should not be indented

&nbsp;

---

&nbsp;

EXAMPLES

#### **Scalar variable creation in `Keywords` section**

Definition on a single line:

```robot
*** Keywords ***
My Keyword
    ${SCALAR}=    Set Variable    This sentence is really, really, really, really, really, really, really long
```

Definition split accross multiple lines (note use of built-in keyword [Catenate](http://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Catenate.).
This is exception for scalars in the `Keywords` and `Test Cases` sections):

```robot
*** Keywords ***
My Keyword
    ${SCALAR}=    Catenate    This sentence is really,
    ...                       really, really, really, really,
    ...                       really, really long
```

#### **List variable creation in `Keywords` section**

Definition on a single line:

```robot
*** Keywords ***
My Keyword
    ${LIST}=    Create List    Mercury    Venus    Earth    Mars    Jupiter    Saturn    Uranus    Neptune
```

Definition on multiple lines:

```robot
*** Keywords ***
My Keyword
    ${LIST}=    Create List    Mercury
    ...                        Venus
    ...                        Earth
    ...                        Mars
    ...                        Jupiter
    ...                        Saturn
    ...                        Uranus
    ...                        Neptune
```

#### **Dictionary variable creation in `Keywords` section**

Definition on a single line:

```robot
*** Keywords ***
My Keyword
    &{DICTIONARY}=    Create Dictionary    a=1    b=${2}    c=${3}    d="some long string"    e=${SOME_LIST}    f=pwoirpworuwruopwuroiewr
```

Definition split accross multiple lines:

```robot
*** Keywords ***
My Keyword
    &{DICTIONARY}=    Create Dictionary    a=1
    ...                                    b=${2}
    ...                                    c=${3}
    ...                                    d="some long string"
    ...                                    e=${SOME_LIST}
    ...                                    f=pwoirpworuwruopwuroiewr
```

#### **Assigning multiple variables**

Definition on a single line:

```robot
My Keyword With Multiple Variable Assignment
    ${SCALAR1}    ${SCALAR2}    ${SCALAR3}=    Set Variable    First long item    Second long item    Third long item
```

Definition split on multiple lines:

```robot
My Keyword With Multiple Variable Assignment
    ${SCALAR1}    ${SCALAR2}    ${SCALAR3}=    Set Variable    First long item
    ...                                                        Second long item
    ...                                                        Third long item
```

### **Line Continuation for Variables in `Test Cases` section**

In test cases, line continuation follows the same guidelines, as in the `Keywords` section.
