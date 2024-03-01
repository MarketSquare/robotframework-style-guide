*** Settings ***
Library    DateTime

*** Test Cases ***
Check Day
     ${today} =   Get Current Date    result_format=%A
     IF    "${today}" == "Friday"
     Log    Tutorial Day!
     ELSE IF    "${today}" == "Saturday" or "${today}" == "Sunday"
     Log    Weekend
     ELSE
     Log    Weekday
     END
