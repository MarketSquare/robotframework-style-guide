# Development in Robot Framework

The document describes the standards for writing code in the Robot Framework (also referred to as RF). It also covers some test and keyword design principles.

Compliance with many of the standards in the code can be checked by the [Robocop](https://github.com/MarketSquare/robotframework-robocop) tool and it is indicated as follows:

* 🟢 *rule-name*: the specified Robocop rule completely checks the thing described
* 🟡 *rule-name*: the specified Robocop rule partially checks the thing described
* 🔵 *#123*: a request has been made with the specified number to create a Robocop rule that would check the described thing
* 🔴 *rule-name*: the specified Robocop rule checks the described thing but is inapplicable for some reason

Many rules and recommendations are reasoned. Most unreasoned rules are motivated by a desire for consistency.

**Reasoning**:

> *Consistency is the reason for the existence of rules that systematically favour a particular variant of a way of working over others that may, however, be equally good. This ensures uniformity in some respects between parts of a project and between projects. Consistency thus contributes to faster orientation in a foreign part of a project (or a foreign project) and removes the need to change configurations of development environments and ways of working when moving to another project. All this results in faster and better quality work. Last but not least, consistent code is a testimony to the author's diligence.*

It is assumed here that the project is written **in the local language** and that it may contain letters with diacritics (i.e. non-lower-ASCII chars). It is distinguished further whether "local language" or "local language without diacritics" (i.e. local language where letters with diacritics marks are e.g. replaced with similar letters without diacritics to be lower-ASCII letters) is used for a particular part of the code. Of course, if the project has to be written in English, this distinction is not used and both options are replaced with English language.

# Spaces and lines

## Spaces

One level of code indentation is **4 spaces**. (🔵 [#504](https://github.com/MarketSquare/robotframework-robocop/issues/504))

Code elements on one line (keywords, their arguments, elements of lists...) are separated by **2 spaces**.

```
IF  ${arrange_insurance}
    Click  "Arrange"
END
```

The exception may be if there are elements on adjacent rows that correspond to each other,

```
*** Variables ***
@{insurance_amounts}      9 €      18 €      27 €      36 €      54 €      72 €
@{fulfilment_limits}  5 000 €  10 000 €  15 000 €  20 000 €  30 000 €  40 000 €
```

or when it comes to arguments of subsequent calls to the same keyword.

```
Fill Field  Card type  Identity card
Fill Field  Issued by  Prague 4 City Hall
Fill Field  Issued on  1. February 2021
```

In such cases, the corresponding elements can be aligned (numbers and quantities to the right, everything else to the left).

**Reasoning:**

> *Aligning unrelated elements in columns gives a false impression of their relatedness or relationship and is therefore confusing. Alignment also involves adding unnecessary spaces. This causes lines to become longer, and the line can then be harder to span by eye and satisfy the line length constraint. Also, a large number of spaces together reduces the sensitivity of the distinction between 1 and 2 spaces, which is a decisive difference in RF. Therefore, alignment is done only when it is reasoned.*

There are **no spaces** at the end of the lines. (🟢 *trailing-whitespace*)

## Lines

There is **1** blank line at the **end** of the file. (🟢 *missing-trailing-blank-line*)

**Reasoning:**

> *These "white" characters are unnecessary and make it difficult to determine exactly where the cursor is when jumping to the end of a line or file.*

Keywords are separated with **1** blank line. (🟢 *empty-lines-between-keywords*). One blank line can also be used to separate unrelated parts of one test case, keyword, a group of variables during declaration, etc.

There is a maximum of **140** characters per line, if possible (🟢 *line-too-long*)

**Reasoning:**

> *This value is better smaller because one may want to have auxiliary windows open in the IDE which take up horizontal space; one may be working on a low-resolution screen; or one may want to have multiple windows with source code side by side.*

# Keywords

## Name

Keywords are named with **full** words (consisting of alphanumeric characters) separated by spaces (🟡 *not-allowed-char-in-name*). It depends on custom of the  language keywords are named in whether **the first letter** of the first word only (e.g. in Czech) or of every word (e.g. in English) **is capital**. Other letters are lower case, unless it is an abbreviation, name, etc. (🟡 *wrong-case-in-keyword-name*)

**Reasoning:**

> *This convention copies the way names are written in a particular language.*

Keywords are named **without diacritics** (🟡 *not-allowed-char-in-name*) in the following form:

* as a command if they do something, e.g. `Adjust Amount` (not `To Adjust Amount`, `Adjusts Amount` nor `Amount Adjustment`);
* as a statement if they check something, e.g. `List Should Be Filled` or `List Is Filled`.

If the keyword must also do something because of the check, or if the check is more complex than can be described in a short sentence, it can be named as a command with the initial word `Check`.

**Reasoning:**

> *The names of some Robot Framework entities should be written without diacritics for various reasons (to be discussed individually below). For the sake of consistency, we write the names of **all** Robot Framework entities (tests, keywords, variables, arguments, tags, ...) without diacritics. On the other hand, texts that are intended for humans only (mainly documentation and comments) should be written the way it is correct in the particular language.*

The recommended length of the keyword name is **15–40 characters**.

**Reasoning:**

> *The relatively long identifier containing spaces corresponds to how keywords from the Robot Framework standard libraries are named.*

When using keywords, we write them (as regards upper and lower case) as they appear in the library documentation (e.g., words from standard libraries in upper case). If this is not necessary, we do not indicate which library the keyword comes from.

## Documentation

In the comment of each keyword before the documentation, we include its author according to the pattern below (`Author` will be written in the local language).

**Reasoning:**

> *The author is the one who should know the meaning of the keyword, be able to modify it according to the requirements and assess whether this modification is appropriate to its use. If the author leaves the team, it is advisable for a replacement to take over authorship.*

Each keyword is documented using `[Documentation]` (🟢 *missing-doc-keyword*, *empty-documentation*). The documentation is written in the local language and simple [formating](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#documentation-formatting) can be used. Names (of entities other than arguments) and literar values of arguments are enclosed between underscores, which puts them in italics in the generated documentation.

The documentation describes the functionality of the keyword (what it does, not how it does it), the content of its possible arguments and the content of the return value.

Keyword documentation takes a form of complete sentences in the announcement mode and it does not begin with the words "Keyword", etc. The documentation of arguments and return values takes the form of nominal phrases (and thus begins with a lowercase letter and does not end with a period). If the keyword has arguments or a return value, it is necessary to add a blank line after the documentation of the keyword functionality which is achieved by making the line blank or by writing the characters `\n\n` in the source code.

**Reasoning:**

> *The documentation of a keyword is essential to its understanding and therefore its use. The convention replicates the way standard libraries are documented, except that it additionally requires documentation of each argument and return value.*

```
*** Keywords ***
Adjust Amount
    # Author: John Doe
    [Documentation]  Adjusts the amount for machine processing; e.g. it converts _3 000,00_ to _3000.00_.\n\n
    ...              Arguments:
    ...              - ``amount``: amount to be adjusted
    ...              Returns:
    ...              - the amount without spaces and with decimal point
    [Arguments]  ${amount}
    ${amount}  Replace String  ${amount}  ${SPACE}  ${EMPTY}
    ${amount}  Replace String  ${amount}  ,  .
    [Return]  ${amount}
```

When writing a keyword into a library that is to be used in another project, everything in the library is written in **English**.

**Reasoning:**

> *Projects can be either in the local language or in English and it would be inconvenient to have a separate language version or libraries for each of these groups. Choosing English will not increase the number of languages in any project, as even projects in the local language already use English keywords: those from standard libraries. The libraries used in the different projects, whoever they come from, have a single language, English.*

# Test Cases

## Name

The names of the test cases are written in **full** words, in the local language **without diacritics**, with spaces and, if necessary, with a moderate use of non-alphanumeric characters (🟡 *not-allowed-char-in-name*). They are written in the form of a nominal phrase if possible, e.g., `Withdrawal of Excess Amount`, neither `Withdraw Excess Amount` nor `Withdraws Excess Amount`.

**Reasoning:**

> *Diacritics should be excluded because test case names can act as command line arguments. In that case, these characters may cause problems when executed on different operating systems.*

## Tags

The names of tags are written in the local language **without diacritics** and with a moderate use of non-alphanumeric characters, e.g.

```
[Tags]  do-not-execute
```

**Reasoning:**

> *The reason is the same as above: the command line.*

## Documentation

Test cases need not be documented. If we document them (🟢 *empty-documentation*), we apply the guidelines for keyword documentation appropriately.

We mention the author of the test in the comment before the documentation according to the following pattern.

```
*** Test Cases ***

Login - Empty Password
    # Author: John Doe
    [Documentation]  Login of an existing user with a blank password.
    Open Login Page
    Enter Name And Password  jdoe  ${EMPTY}
    Login Should Fail
```

# Variables

## Names

Variables have several possible purposes, (in the Robot Framework) **they are typically used**:

* to mark keyword arguments,
* to store locators,
* to share values between different parts of the code.

Variables are named in the local language **without diacritics** using only alphanumeric characters and with words connected by underscores (🟡 *hyphen-in-variable-name*, 🔵 [#502](https://github.com/MarketSquare/robotframework-robocop/issues/502)); this is specified below for each type of variable. The name of the variable should reflect its content.

**Reasoning:**

> *It is a slight limitation (includes omitting spaces) of RF designers' recommendation.*

### Arguments

Arguments are written in the local language **without diacritics**, with all lower case letters, with words joined by underscores, e.g.

```
[Arguments]  ${amount_to_withdraw}
```

**Reasoning:**

> *Standard library keyword arguments are named the same way.*

### Locators

The name of the locator has three components:

1. the name of the area or screen being tested,
2. a description of the element,
3. an ending identifying the type of element (see below).

Locators are written in the local language **without diacritics** and using lowercase and the individual components of the name and the word within one component are separated by underscores, e.g. `${account_export_cancel_printing_btn}`.

Each locator is commented to make it clear which element it corresponds to.

```
*** Variables ***
${deposit_btn}  //button[@id='DepositBtn']  # Button "Deposit" in the top bar
```

The element suffixes are standardized and listed in the table below. They are based on English, also in a project written in the local language. The suffixes are chosen according to how the element looks and behaves, not how it is implemented.

| Suffix   | Meaning in English | Typical implementation                               |
| -------- | ------------------ | ---------------------------------------------------- |
| `area` | area               | `<div>`                                            |
| `btn`  | button             | `<button>` or `<a>` or `<input type='button'>` |
| `col`  | column             | `<th>`                                             |
| `date` | date               | `<input type='date'>`                              |
| `drop` | drop-down list     | `<select>`                                         |
| `edit` | edit box           | `<input>` or `<textarea>`                        |
| `chb`  | check box          | `<input type='checkbox'>`                          |
| `img`  | image              | `<image>`                                          |
| `lbl`  | label              | `<label>`                                          |
| `link` | link               | `<a>`                                              |
| `opt`  | option             | `<option>`                                         |
| `pwd`  | password           | `<input type='password'>`                          |
| `rbtn` | radio button       | `<input type='radio'>`                             |
| `row`  | row                | `<tr>`                                             |
| `tbl`  | table              | `<table>`                                          |
| `text` | text               | `<span>`                                           |
| `time` | time               | `<input type='time'>`                              |
| `tit`  | title              | `<h1>` to `<h6>`                                 |

### Other Variables

Local variables (existing or used in a single keyword or test) are named in the local language **without diacritics**, with all lowercase letters and words joined by underscores, e.g.

```
${selected_currency}  Get Selected List Label  //select[@id='currency']
Element Text Should Be  //span[@id='accountCurrency']  ${selected_currency}
```

Global variables (used for sharing information between multiple keywords or tests) are named in the local language **without diacritics** with all capital letters and with words joined by underscores (🔴 *non-local-variables-should-be-uppercase*), thus e.g.

```
*** Variables ***
${BROWSER}  Chrome
${LOGIN_PAGE}  http://www.example.com

*** Keywords ***
Launch Browser
    [Documentation]  Launches the browser on the default page
    Open Browser  ${LOGIN_PAGE}  ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains  Welcome!
```

**Reasoning:**

> *The built-in RF variables are also named using uppercase, and these are global. Separating by underscores is analogous to the notation of local variables.*

## Usage

When using custom variables, they are written (in terms of case, spaces and underscores) as they are defined (🟡 *possible-variable-overwriting*, 🔵[#496](https://github.com/MarketSquare/robotframework-robocop/issues/496)).

[Built-in variables](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#built-in-variables) are written as they are defined, i.e. in capital letters. The exceptions to this rule are variables `${True}`, `${False}` and `${None}`, which are written as shown here. However, these variables should not be used unless necessary to communicate with certain keywords written in Python. Instead, (strings) `True` and `False` are used to denote truth values; `${None}` has no counterpart in the Robot Framework.

**Reasoning:**

> *We only write these variables with the first letter capitalized for the sake of analogy: the textual value of these variables when evaluated in Python is True, False, and None in sequence, with this case. It matters in this case because they are special constants for Python.*
>
> *The truth variables `${True}` and `${False}` bring Python's true and false, so it is not appropriate to use them for truth values purely in the Robot Framework–the strings `True` and `False` are reserved for these purposes. Moreover, both `${True}` and `True` are evaluated the same way: as the Python's constant `True`. Similarly with `${False}` and `False`.*

We **usually** use [normal ${variable} syntax](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#evaluating-expressions). The [special $variable syntax](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#evaluating-expressions) is reserved for justified special cases.

"Equals" character is not used for assignment to a variable; thus one writes e.g. `${a}  Set Variable  1` (🟢 *inconsistent-assignment*).

# Comment

The code is written so clearly and the objects are named so concisely that comments are not necessary at all.

Comments are written in the local language with the initial letter capitalized. A space is used between the initial `#` and the text (🟢 *missing-space-after-comment*), e.g.

```
# Deposit the correct amount into the account
```

# Structure of folders and files

The structure and naming of the project folders and files is as follows.

* `Data/` – configuration and test data (in other format than for Robot Framework)
* `Documentation/` – generated documentation of keywords, possibly also of tests
* `Resources/` – stuff specific to the project; written in RF as `.resource` (🟢 *can-be-resource-file*); there can be a hierarchy of folders corresponding to the hierarchy of thematic areas, screens, modules of the tested application, etc. here
  * `Common.resource` – locators and keywords of common parts of the project, e.g. related to the main menu, header and footer of the tested application
* `Results/` – logs and output files of tests
* `Start/` – scripts for running tests and their auxiliary files
  * `arguments.txt` – argument file for running the test(s)
* `Tests/` – test suites; written as `.robot` in RF; there may be a hierarchy of components corresponding to the test suite hierarchy here

The names of files and folders are written in the local language **without diacritics** (except for the ones listed here–they are in English) using only alphanumeric characters with capital initial letters of each word.

# Test sets and keyword files

## Content of files

A fundamental distinction is made between test case files (in `Tests/`, and one file corresponds to a test suite) and keyword files (in `Resources/`).

**Reasoning:**

> *Separation is important for clarity, especially for reuse: keywords are reusable (in other tests of the same project or even in other projects), tests are not.*

The keyword file contains the following:

1. loading the necessary libraries and source files
2. definition of locators needed (at least potentially) in multiple keywords of this file (need not be present)
3. keywords

The test suite contains the following:

1. loading the needed libraries and resource files
2. setups and teardowns of the tests and test suite (need not be present)
3. configuration variables common to all tests in the suite (need not be present)
4. tests

Test suites contain keywords only if

* it is data-driven testing, and the keyword is a test template,
* or the keyword contains part of a test which has been separated into it for clarity or reuse in another test of the same suite.

Thus, in both cases, it is a keyword that is not usable outside the test suite in which it is defined; it is then placed before the tests (🟢 *section-out-of-order*). Otherwise, it is placed in one of the keyword files.

Thus, locators do not have their own files, but are located in the keyword files that use them. (In justified cases, however, a project may store locators in some external location, i.e. outside the RF files.)

## Scope of files

One file has a maximum of **500 lines**, preferably (🟢 *file-too-long*).

One test suite contains a maximum of **10 tests**, unless they are data-driven tests (🟢 *too-many-test-cases*).

**Reasoning:**

> *If these boundaries are breached, it is to be expected that the files will contain poorly related matters. These should then be separated into other files for clarity.*

## Loading libraries and source files

The order of loading necessary resources into the file (i.e. in its `Settings` section) is as follows:

1. libraries (using `Library`)
   1. built-in (*Builtin, String*, *Collections*, …)
   2. third-party (*SeleniumLibrary*, *Browser*, …)
   3. custom (🟢 *wrong-import-order*)
2. resources (using `Resource`)
   1. from `Resources/`
   2. `Common.resource`
   3. from `Data/`

Libraries or resource files whose keywords are used in a large number of files are loaded into `Common.resource`, which is loaded into virtually every test and resource file; thus, there is no need to list these libraries or resource files repeatedly. On the contrary, libraries and source files that are specific to a certain file are only loaded into that file. It is important to make sure libraries with arguments are loaded in the correct places, as each loading creates another library instance with a possibly different configuration.

# Principles of tests and keywords design and development

Note: since they are typically existing tests already designed for manual execution what is being automated, the design of automated tests is determined by these used documents to some extent.

## Setup and Teardown

Activities to be performed before a test (or test suite), but not logically being part of it, should not be part of it in the code. These activities typically include checking that the test prerequisites are met (e.g., test connectivity to the necessary interfaces or systems), putting the application in a state suitable for test execution (e.g., launching a web browser and navigating to the appropriate application page), and preparing the test data. It is useful to collect these activities into a keyword to be used as `Test Setup` (`Suite Setup`). It needs to be thought through what needs to be done before each test, and what just needs to be done at the beginning of the test suite. For example, one typically only needs to launch the browser at the beginning of the suite, whereas at the beginning of the test one only needs to navigate to the home page of the application under test.

Similarly, cleanup performed after running a test (or test suite), such as deleting temporary data or closing a browser window, should be called as `Test Teardown` (`Suite Teardown`).

**Reasoning:**

> *The separation of these activities into setups and teardowns contributes to clarity and reusability and allows compliance with the test code for manual execution. In particular, separating the test suite into setups and teardowns can also contribute to faster test runs, as it is the only mechanism to perform some time-consuming operations (e.g., launching a browser) once for multiple tests.*

If a test needs some test data, it is typically more correct to create it than to look for suitable data from the existing ones. This is because there is a risk of not finding any suitable ones.

## Common to tests and keywords

Duplication is tried to be avoided because it leads to code that is harder to maintain: repetitive value entries can be turned into a variable; a repetitive sequence of keyword calls can be turned into a new keyword...

Each action should contain a check if it has been performed, e.g. after pressing a button it should be checked if an element that appears only after pressing the button has appeared on the screen.

**Reasoning:**

> The test thus possibly crashes right at the point where the first deviation from the expected run occurred, which leads to greater clarity and a faster crash, which must occur anyway.

It is prefered to create variables from values that can change; this takes them out of the code and makes them easier to find.

If the test script or keyword contains commented code, it is accompanied by information on when to uncomment it.

The code does not contain unused variables (🔵 [#209](https://github.com/MarketSquare/robotframework-robocop/issues/209)) nor arguments (🔵 [#501](https://github.com/MarketSquare/robotframework-robocop/issues/501)).

Even if it is not necessary to pass an argument along with its name to a keyword, it is better to do it if the name clarifies the role the argument plays in the keyword.
E.g. `Choose Insurance  Yes  No  Yes` is better written as `Choose Insurance  injury=Yes  illness=No  liability_for_damage=Yes`;
and in case of `Page Should Contain Button  Next  Cannot find the button for continuing`, it is clearer to add the name `message` to the second argument.

A test case and a keyword contain a maximum of **20 steps**, (🟢 *too-many-calls-in-test-case*, *too-many-calls-in-keyword*) and we try to encapsulate logically related steps into new keywords in case of larger number of steps.

## Tests

The test should consist only of keywords created for the tested application, so it should "speak the language" of the application and its business. The ideal is that it should be possible to execute the test manually following the test case transcript for RF.

**Reasoning:**

> *This approach allows both to have a single test transcript for manual as well as automatic execution, and to compose tests from prepared keywords even to people who do not have a technical background. Keyword-driven testing, of which the Robot Framework is an implementation, is based on this idea.*

The test should contain as few variables as possible, be they in place of keyword arguments or their values. An exception is the possible definition of test data (these are, however, defined as test variables and are no longer passed explicitly between keywords).

**Reasoning:**

> *Variables create a layer of abstraction that is not typically required in keyword-driven testing, and which in turn makes it difficult to understand a test that is intended to be written in human-like language.*

## Keywords

### Design and Interface

When using a transcript for handwritten tests as a source, we design keywords to replicate the vocabulary and level of detail of the handwritten transcript wherever possible. Thus, keywords can be at both high and low levels of abstraction ("Create an account for a legal entity" versus "Check button *I want to subscribe to emails*"). If they are at a higher level of abstraction, they should be composed of more elementary keywords designed for the application (e.g., the keyword for account creation will break down into keywords describing the activities in each step of account creation). Thus, complex logic, branching (conditional execution and loops), and technical issues (e.g., locators using technical element attributes) only start to occur at the second or third level of code (i.e., at the first or second level of keywords).

**Reasoning:**

> *Deferring the technical details of test implementation to the deepest possible level is an extension of the above principle and makes it possible to reduce the need for intervention of a technically knowledgeable person to the lowest possible level.*

The keyword argument is set to a default value if the value is more common than the others.

Keywords are designed to return values of a single type: e.g. if it should return the index of an element (i.e. an integer), in case of not finding it, we return e.g. (integer) `-1`, not e.g. (string) `False`.

**Reasoning:**

> *This makes it easier to check the return value.*

Keyword arguments that bring boolean values are named positively (e.g. `has_phone`), not negatively (`has_no_phone`).

**Reasoning:**

> *This will simplify their setting and checking, as double negation (`has_no_phone=False`) is avoided.*

### Waiting (in Browser Library)

Using the `Sleep` keyword while waiting for some application state is avoided as much as possible. Instead, a keyword that continues immediately when the desired condition is met is used, their names start typically with `Wait Until` or `Wait For`.

**Reasoning:**

> *Using `Sleep` will not guarantee that the desired state will be reached and may take an unnecessarily long time.*

Keywords `Wait For...` are what is used for waiting (keywords `Get...` are used primarily to check or determine values).

Wait timeouts are redefined not during the test run (unless necessary), but before the run: during initialization or in the setup.

When calling keyword for waiting, no timeout is given if it is the same as the default one (*timeout*). However, we can change the default times (*timeout* and *retry_assertions_for*).

**Reasoning:**

> *Providing timeouts clutters up the code with technical details, and this should only be done when necessary.*

If it is appropriate to distinguish between more than the two existing timeouts (see above), additional timeouts can be defined based on estimated effects on the maximum time-to-condition (e.g., displaying an element dependent vs. independent of the integration call). However, we define only a few timeouts.

**Reasoning:**

> *The reasons why we do not try to distinguish waiting timeouts too finely are that it is time-consuming to tune them and that we need detailed technical knowledge of how the application works.*

Unnecessary explicit waiting is avoided where implicit waiting is sufficient; however, explicit waiting should be redundantly used where custom, understandable error messages has to be given (at least in the most commonly used custom keywords).

When waiting for a state that comes after another state, splitting the waits should be considered: to wait for the other state at first and then for the desired state. This is worthwhile if the time saving can be larger, i.e. the difference between the maximum and minimum time to get to the other state is larger, and/or if this waiting occurs frequently. This typically happens e.g. when waiting for the display of an element on a page which may take a long time to render; or when processing many records until a window appears indicating that there is nothing more to process.

**Reasoning:**

> We are waiting for S<sub>1</sub> state (e.g. displaying an element), but before it necessarily occurs S<sub>0</sub> state (e.g. displaying the page where the element occurs). The transition to S<sub>0</sub> state takes *min<sub>0</sub>* to *max<sub>0</sub>*, the transition from S<sub>0</sub> to S<sub>1</sub> takes *min<sub>1</sub>* to *max<sub>1</sub>*.
>
> When waiting for S<sub>1</sub> "directly", we have to set the wait timeout to *max<sub>0</sub>+max<sub>1</sub>*, and it will be exactly exhausted if waiting for S<sub>1</sub> fails. The other option is to split waiting for S<sub>1</sub>, i.e. to set the wait timeout for S<sub>0</sub> to *max<sub>0</sub>* and then the wait timeout for S<sub>1</sub> to *max<sub>1</sub>*. If S<sub>1</sub> is not reached, it also has taken *max<sub>0</sub>+max<sub>1</sub>* at maximum, but maybe only *min<sub>0</sub>+max<sub>1</sub>* -- depending on when S<sub>0</sub> occurred. Thus the possible time saving is equal to the difference of the latter values, i.e. *max<sub>0 </sub>-min<sub>0</sub>*.
>
> If eventually S<sub>1</sub> state is reached, no time is saved by splitting.

### Implementation

At least in places where manual tests prescribe some checking, an understandable error message in "business" terminology is output if the condition is not met. Thus, optional arguments `message` or `error` are widely used. No punctuation follows the error message.

Keywords are written to be robust: they check that they have everything ready to take the action before taking it (e.g., the elements are in the state the action can be taken in) and then, if possible, they check that the action has been taken correctly.

**Reasoning:**

> *This leads to shorter and more maintainable code because the checks are in one place.*

Variables bringing truth values are written into conditions without redundant comparisons, e.g. as `IF  ${truth_variable}` or `IF  not ${truth_variable}`.

**Reasoning:**

> *The opposite case (`IF  ${truth_variable} == False` etc.) does not correspond to ordinary speech and is more complicated.*

Capability to evaluate expressions in Python should not be abused: it is only used for simple operations that eliminate unnecessary auxiliary variables but do not reduce readability. E.g. in case of extended variable syntax, `${title.upper()}`, `${SPACE * 5}` or `${count + 1}` are examples of appropriate use.

Absolute locators and absolute file paths (i.e., those specifying each element from the root of the structure to the target item) are contained in the code only when justified.

**Reasoning:**

> *The test would be sensitive to even cosmetic changes in the application in the first case, and to moving the test project within the file system in the second case.*

If multiple keywords should be executed when a condition is satisfied, construction `IF ... ELSE IF ... END` is used. If only one keyword should be executed, one-line `IF` should be used.

# Used Resources

* [How to write good test cases using Robot Framework](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst)
* [Kvalita kódu automatizovaných testů v nástroji Robot Framework pro testování webových aplikací](https://vskp.vse.cz/72350_kvalita-kodu-automatizovanych-testu-v-nastroji-robot-framework-pro-testovani-webovych-aplikaci) (in Czech)
* [Writing Maintainable Automated Acceptance Tests](http://dhemery.com/pdf/writing_maintainable_automated_acceptance_tests.pdf)
