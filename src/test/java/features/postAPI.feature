Feature: This feature is for POST API endpoints

  Background:
    Given url baseUrl

  @postAPI
  Scenario: POST with inline body
    Given path '/public/v2/users'
    And header Authorization = 'Bearer ' + myToken
    And header Content-Type = "application/json"
    And request {"name": "AI Karate FW agent", "email": "Ai14511AgentKF@example.com", "gender": "male","status": "active"}
    When method POST
    Then status 201
    * match response.name == 'AI Karate FW agent'
    * match response.email contains 'Ai14511AgentKF'
    * match response.gender == 'male'
    * match response.status == 'active'

  @postAPI
  Scenario: POST with body from variable
    * def requestPayload =
      """
      {
      "name": "AI Karate FW agent",
      "email": "Ai23926123AgentKF@example.com",
      "gender": "male",
      "status": "active"
      }
      """
    Given path '/public/v2/users'
    And header Authorization = 'Bearer ' + myToken
    And header Content-Type = "application/json"
    And request requestPayload
    When method POST
    Then status 201
    * print response
    * def responseBody = response
    * match responseBody.name == '#string'
    * match responseBody.email == '#string'
    * match responseBody.gender == '#string'
    * match responseBody.status == '#string'
    * match responseBody.name == 'AI Karate FW agent'
    * match responseBody.email contains requestPayload.email
    * match responseBody.gender == 'male'
    * match responseBody.status == 'active'

  @postAPI
  Scenario: POST with body from file
    * def requestPayload = read('create_users_post_payload.json')
    Given path '/public/v2/users'
    And header Authorization = 'Bearer ' + myToken
    And header Content-Type = "application/json"
    And request requestPayload
    When method POST
    Then status 201
    * print response
    * def responseBody = response
    * match responseBody.name == '#string'
    * match responseBody.email == '#string'
    * match responseBody.gender == '#string'
    * match responseBody.status == '#string'
    * match responseBody.name == 'AI Karate FW agent'
    * match responseBody.email contains requestPayload.email
    * match responseBody.gender == 'male'
    * match responseBody.status == 'active'

  @postAPI
  Scenario: POST with body from src/test/resources file
    * def requestPayload = read('classpath:src/test/resources/payloads/create_users_post_payload.json')
    Given path '/public/v2/users'
    And header Authorization = 'Bearer ' + myToken
    And header Content-Type = "application/json"
    And request requestPayload
    When method POST
    Then status 201
    * print response
    * def responseBody = response
    * match responseBody.name == '#string'
    * match responseBody.email == '#string'
    * match responseBody.gender == '#string'
    * match responseBody.status == '#string'
    * match responseBody.name == 'AI Karate FW agent'
    * match responseBody.email contains requestPayload.email
    * match responseBody.gender == 'male'
    * match responseBody.status == 'active'
