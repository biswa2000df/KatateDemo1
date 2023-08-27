Feature: Delete API Request demo

  Scenario: Delete demo
    Given url 'https://reqres.in/api/users/2'
    When method Delete
    Then status 204
    And print response
    And print responseStatus
