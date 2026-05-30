Feature: Working with random strings, functions and passing it into scenario

  Background:
    Given url baseUrl
    # random string function
    * def randomString =
      """
      function(length) {
      var pool = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      var result = "";
      for (var i = 0; i < length; i++) {
       result += pool.charAt(Math.floor(Math.random() * pool.length));
      }
      return result;
      }
      """
    * def randomPrefix = randomString(10)

  @postAPIRandomString
  Scenario: Working with functions into scenarios
    * def requestPayload =
      """
      {
      "name": "AI Karate FW agent",
      "gender": "male",
      "status": "active"
      }
      """
    * requestPayload.email = randomPrefix + "@gmail.com"
    * print requestPayload
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
    * print responseBody.email + ' --- this is from response'
    * match responseBody.email contains requestPayload.email
    * match responseBody.gender == 'male'
    * match responseBody.status == 'active'

  @postAPIRandomString
  Scenario: Working with functions into scenarios - calling external json file
    * def requestPayload = read('create_users_randomString.json')
    * requestPayload.email = randomPrefix + "@gmail.com"
    * print requestPayload
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
    * print responseBody.email + ' --- this is from response'
    * match responseBody.email contains requestPayload.email
    * match responseBody.gender == 'male'
    * match responseBody.status == 'active'
    * print responseBody.id
