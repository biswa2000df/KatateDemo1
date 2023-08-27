Feature: PUT API Request demo

  Scenario: PUT demo 1
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "morpheus","job": "zion resident"}
    When method PUT
    Then status 200
    And print response
    And print responseStatus
    And print name
    #Other features discussed in POST
    #Examples will apply here
    #Background
    #Assertion
    #Get request body from file
    #Assert response from file
