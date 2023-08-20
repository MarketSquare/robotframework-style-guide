# Code Conventions

This document contains the conventions we have decided upon for creating automated testcases in Robot Framework. The existing standards from Robot Framework have been taken as a guideline to start off with.

Some things we want to work towards in the future:

* Within a testcase the name of the resource should not be used in front of keywords.
* Resourcefiles should have .resource instead of .robot extension.
* Testcases should be as short as possible and test but one thing.

## General

1. Allignment should be consistent within a section. (Settings, Variables, Testcases) keywords and parameters should be spaced on longest line +4 spaces.
2. Maximum line length: 180 chars
3. Set global System parameters only when you really cannot do it in another way.
    1. Put the system parameter back during Teardown
    2. Add tag `sequential_only`
4. Language
    1. Framework Keywords -> English
    2. TestSuite Keywords -> Domain Language
5. Tags are always lowercase, may contain underscore, no spaces.

## Variable Section

6. Naming: Variables should have a clear functional name. You are allowed to use spaces or underscores for readability.
7. Local variables -> Lowercase all others UPPERCASE
8. Use ${CURDIR} instead of defining the path to the directory of the testsuite.
9. Variable assignment is done without the = sign
    * Incorrect: `${VAR}=    value`
    * Correct:   `${VAR}    value`
10. Global variables that are defined in variable files (env/*.py) should not be redeclared in the testsuites once imported.
11. Global variables should not be redirected to other variables with different names, use the original name.

## Testcases Section

12. Goal and Expectation should be explicitly added in testcase documentation. This is to be done in the following format:

```robot
| *Goal*        | <goal of the testcase>            |
| *Expectation* | <expected result of the testcase> |
```

13. Test steps must be written in the domain language such that they are readable as documentations. Used arguments are also written in the domain language, that might be passed through to English Framework keywords.
14. Use only named arguments with keywords.
15. Do not add already declared default values for arguments in your testcases.
16. Testcases should have a maximum of 20 teststeps (keywords)
17. Use Title Case for keywords
18. Create separate keywords that contain all actions to be done in Setup and respectively Teardown
19. Do not use the following keywords:
    * `Run Keywords` -> should be replaced with a functional keyword
    * `Sleep` -> should be replaced with some kind of Wait Until
