Feature: Get user details with headers

  Background:
    Given url baseUrl

  Scenario: WAY 1 :: Extract token from config files
    * def myHeaders = {"Accept": "application/json","Content-Type": "application/json","Authorization": "Bearer 5188ca0fca93a740de2a85f61a5bba9db4c7ab35e2109d5436d364d6222aacf9"}
    * print myToken
    And path '8482963'
    When method GET
    Then status 200
    * print response

  Scenario: Extract the token from config and set in the header
    * print myToken
    And header Authorization = 'Bearer ' + myToken
    And path '8482963'
    When method GET
    Then status 200
    * print response
