Feature: Config demo

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  Scenario: Config demo 1
    Given print name
    And print age
    And print baseURL

  #Simple GET Request
  Scenario: Get Demo 1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    
    ##  System.setProperty("karate.env", System.getProperty("karate.env"));