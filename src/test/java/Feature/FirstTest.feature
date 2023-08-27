Feature: Samole API Tests


#this is the first test for the using the get method in the test
  Scenario: Test a Sample get API
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200

    
    