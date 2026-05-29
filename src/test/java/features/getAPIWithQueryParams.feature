Feature: Get API with Query parameters

  Background:
    Given url baseUrl

  Scenario: Extract values using query params
    * def query = {status: 'active', gender: 'male', id: '8482963'}
    * print query
    Given path '/public/v2/users'
    And params query
    When method GET
    Then status	200
    And print response
    * def responseBody = response
    And match responseStatus == 200
    And match responseBody[0].email contains 'AIAutoKanak'
