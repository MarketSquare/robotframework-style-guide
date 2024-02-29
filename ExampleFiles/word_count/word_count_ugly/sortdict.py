#!/usr/bin/env python3

""" This is a simple python library, which can be imported in Robot Framework code
by the module name, and used as a Keyword in test cases.

Example:

*** Settings ***
Library    sortdict.py


*** Test Cases ***
My Test
    ${sorted_data}=    Sort Dictionary    ${some_dictionary}
    Log    ${sorted_data}
"""

def sort_dictionary(dictionary):
    """ Sorts dictionary items by the values in descending order """
    sorted_data = dict(sorted(dictionary.items(), key=lambda item: item[1], reverse=True))
    return sorted_data
