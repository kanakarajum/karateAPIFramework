Feature: This feature is for PUT endpoint

  Background:
    Given url baseUrl

  @putAPI
  Scenario: Put - full update the enpoint from variabler
    * def requestBody =
      """
      {
        "name": "Updated Name1",
        "status": "inactive"
      }
      """
    And path '/public/v2/users/8483082'
    And header Authorization = 'Bearer ' + myToken
    And header Content-Type = "application/json"
    And request requestBody
    When method PUT
    Then status 200
    * print response
    And match response.name == requestBody.name

  @putAPI
  Scenario: Put - full update the enpoint from variable - With Dynamic path paramater
    * def userID = '8483082'
    * def requestBody =
      """
      {
        "name": "Updated Name1",
        "status": "inactive"
      }
      """
    And path '/public/v2/users/' + userID
    And header Authorization = 'Bearer ' + myToken
    And header Content-Type = "application/json"
    And request requestBody
    When method PUT
    Then status 200
    * print response
    And match response.name == requestBody.name
