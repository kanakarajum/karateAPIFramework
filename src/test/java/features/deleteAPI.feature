Feature: This feature is for DELETE API endpoint

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

  @deleteCall
  Scenario: Verify deleting the user
    # POST - Creating a user
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
    # fetch the ID from response body
    * def responseUserID = responseBody.id
    * print "POST response ID :: "+responseUserID
    # GET call: verify the name after PUT using GET call
    And path '/public/v2/users'
    And path responseUserID
    And header Authorization = 'Bearer ' + myToken
    And header Content-Type = "application/json"
    When method GET
    Then status 200
    * def responseBody = response
    * match responseStatus == 200
    * match responseBody.name == requestPayload.name
    # DELETE call: Deleting the user
    And path '/public/v2/users'
    And path responseUserID
    And header Authorization = 'Bearer ' + myToken
    And header Content-Type = "application/json"
    When method DELETE
    Then status 204
    # GET call : Sanity check if the user is deleted or not
    And path '/public/v2/users'
    And path responseUserID
    And header Authorization = 'Bearer ' + myToken
    And header Content-Type = "application/json"
    When method GET
    Then status 404
    And match response.message == 'Resource not found'
