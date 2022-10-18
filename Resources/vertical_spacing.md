# Vertical White Space

These are the recommended vertical space guidelines for .robot and .resource files.

The guidelines of larger sections will supercede the guidelines of the subsections.

## Spacing after the Section Header line

There should be no space after each section header line:

    *** Settings ***  
    *** Variables ***  
    *** Test Cases ***  
    *** Tasks ***  
    *** Keywords ***  
    *** Comments ***  

## Spacing After Sections

There should be 2 lines of white space after the last line of each section, except the last section of the file.

The last section of a file should have 1 line of white space.

## Spacing After Keywords

There should be 1 line of white space after the last line in a keyword code block.

## Spacing Between Keyword Calls

In most cases there should be no white space between keyword calls.

### Spacing Between Code Blocks Within Keyword Calls

Ocassionally keywords can be grouped in subsections of logical code blocks. In these instances it is acceptable to have 1 space between these code blocks.

## Spacing After Test Cases or Tasks

There should be 1 line of white space after each Test Case or Task.

## Spacing Between Code Blocks Within Test Cases or Tasks

Ocassionally Test Cases or Tasks can be grouped in subsections of logical code blocks. In these instances it is acceptable to have 1 space between these code blocks.

## Spacing After Templated Test Cases

There should be 1 line of white space after each Templated Test Case.

## Spacing Between Templated Test Case Data

No lines of white space should exist between lines of test data in Templated Tests.

## Spacing Between Settings Within The Settings Section

It is recommended to allow 1 line of white space between common lines of settings.
    Documentation
    Library
    Metadata
    Resource
    Variables
    Default Tags
    Force Tags
    Suite Setup
    Suite Teardown
    Test/Task Setup
    Test/Task Teardown
    Test/Task Template
    Test/Task Timeout

## Spacing Between Settings Within A Test Case or Task or Keyword

No lines of white space should exist between the settings of a Test Case or Task or Keyword.

## Spacing Of Line Continuations

No lines of white space should exist between lines of code using line continuation (..) syntax.

## Spacing Between Variables In The Variables Section

There should be no lines of white space between variables within the Variables section.