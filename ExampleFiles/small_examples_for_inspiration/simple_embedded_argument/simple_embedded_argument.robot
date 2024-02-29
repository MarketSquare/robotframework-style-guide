*** Tasks***
Learn Country
    Print Country Info    country=Finland    population=5,600,000
    ...              area=338,455 km2    lakes=more than 180,000
    ...              capital=Helsinki    drink=milk

*** Keywords ***
Print Country Info
    [Arguments]    ${country}    ${population}    ${area}    ${lakes}    ${capital}    ${drink}=milk
    Log Many    ${country} has a population of about ${population} million. It has total area of ${area} and ${lakes} lakes.
    ...         The capital of ${country} is ${capital}. People in ${country} drink a lot of ${drink}.
