Feature: Get API examples

  Background:
    Given url baseUrl

  Scenario: Verify get users api call
    Given path '/public/v2/users'
    When method GET
    Then status 200
    * print response
    * def responseBody = response
    * match responseBody == response
    * print responseBody[0].name
    * match responseBody[0].name == 'Anilabh Iyengar'
    * match responseStatus == 200

  Scenario: Extract specific user details and validate schema and response data
    * def userEmail = 'keerti_johar@jacobson.test'
    * def gender = 'female'
    * def status = 'active'
    * def name = 'Keerti Johar'
    * def id = 8056489
    Given path '/public/v2/users'
    And path id
    When method GET
    Then status 200
    * def responseBody = response
    * match responseStatus == 200
    * match responseBody.id == '#notnull'
    * match responseBody.id == '#number'
    * match responseBody.name == '#string'
    * match responseBody.email == '#string'
    * match responseBody.gender == '#string'
    * match responseBody.status == '#string'
    * match responseBody.id == id
    * match responseBody.name == name
    * match responseBody.email == userEmail
    * match responseBody.gender == gender
    * match responseBody.status == status
