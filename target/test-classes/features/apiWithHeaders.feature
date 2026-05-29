Feature: Get user details with headers

  Background:
    Given url baseUrl

  Scenario: WAY 1 :: Pass the user request with headers in an key:value pair
    * def myHeaders = {"Accept": "application/json","Content-Type": "application/json","Authorization": "Bearer 5188ca0fca93a740de2a85f61a5bba9db4c7ab35e2109d5436d364d6222aacf9"}
    And headers myHeaders
    And path '8482963'
    When method GET
    Then status 200
    * print response

  Scenario: WAY 2 :: Pass the request with header individually
    And header Content-Type = "application/json"
    And header Authorization = "Bearer 5188ca0fca93a740de2a85f61a5bba9db4c7ab35e2109d5436d364d6222aacf9"
    And path '8056489'
    When method GET
    Then status 200
    * print response

  Scenario: WAY 3 :: Pass the request with header using configure keyword
    * configure headers = {"Accept": "application/json","Content-Type": "application/json","Authorization": "Bearer 5188ca0fca93a740de2a85f61a5bba9db4c7ab35e2109d5436d364d6222aacf9"}
    And path '8482963'
    When method GET
    Then status 200
    * print response
