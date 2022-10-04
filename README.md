# robotframework-style-guide
Robot Framework Style Guide

# Table of Content

## Generic Coding Rules

### Spacing (Line Break, Line Spacing, Indentation, Spaces)

#### Horizontal Spacing  (part 1, Guido)

- Type of Separators (\t space pipe?) No pipes!
- The recommended spacing between tokens is 4 spaces. While other spacing is allowable down to 2 spaces, 4 spaces is a good value for readability.
- Separators in line
  - Separators between Keywords and Arguments
  - Separators between Arguments
  - Separators in Statements (FOR, IF, WHILE)
  - Separators between Variables and Keyword
  - Space between Vars and = ? (and whether to use "=" at all)
  - Separators before Comments and after comment char
  - Alignment/Separators Line Continuation
- Indentation of Blocks
  - IF Blocks, TRY/CATCH, WHILE, FOR (END)
  - High Level Blocks = Required indention of Keywords within Test Cases
- Trailing Spaces?
  - [#trailing-whitespace](https://robocop.readthedocs.io/en/stable/rules.html#trailing-whitespace)
- Spacing in SettingsHeaders
- Indentation to block (in some cases)
- Max. length of lines (_does belong here?_)


#### Vertical Spacing (Part 2, Kelby)
- Spacing between Section Header and first Content
- Spacing between Sections 2!
- Spacing between Keywords Definitions
- Spacing between Keyword Calls [01]
- Spacing between Test Cases/Tasks
  - Spacing between templated TestCases
- Empty Line at end?
- Spacing between Settings in Settings Section
- Using of empty lines in the middle of a KW (or TC, headers, ...)

### Line Continuations

#### Variables
- Line continuation in
  - Scalar
  - Dicts
  - Lists

### Naming
- ... of (local vs. global) variables, KWs, TCs, tags, files (including extensions `.robot` vs. `.resource`)
-Tags
-Suite / Clobal > capital case
- (Non-)allowed characters, naming conventions like snake case, camel case etc.
- Semantic rules, e.g.
  - Boolean variables starts with a verb: _is__, _does__, _has__, ...
  - KW are in imperative mood
- Length of names

### Documentation
- What should be documented (global variables, KWs, TCs, TSs...?)

## Suite Level Rules
- Max. number of lines in a file (this is not only for suite files)
- Max. number of TCs in a file (except for when written using a template)

### Vertical Orders
- Order of Sections
- Order in Settings Section

### Test Level Rules
- Max. number of KW calls in a test

## Resource Level Rules
- Max. number of KW calls in a KW


### Vertical Orders


## Variable Rules
