Feature: Post demo

  #also it write in the scenario body like as   And def exceptedOutput = read('Response.json') this type.
  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def exceptedOutput = read('Response.json')

  #Simple post scenario
  Scenario: Post demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Biswajit sahoo","job": "leader"}
    When method POST
    Then status 201
    And print response

  #Simple post  With Background scenario
  Scenario: Post demo 2
    Given path '/users'
    And request {"name": "Biswajit sahoo","job": "leader"}
    When method POST
    Then status 201
    And print response

  #Simple post  With Assertion
  Scenario: Post demo 3
    Given path '/users'
    And request {"name": "Biswajit sahoo","job": "leader"}
    When method POST
    Then status 201
    And match response == {"name": "Biswajit sahoo","job": "leader","id": "#string", "createdAt": "#ignore"}
    * print response

  #Simple post  validate with the response file present or not what we post excepted and actual  using the "Response.json" this file ..
  #Read response from file
  Scenario: Post demo 4
    Given path '/users'
    And request {"name": "Biswajit sahoo","job": "leader"}
    When method POST
    Then status 201
    And match response == exceptedOutput
    And match $ == exceptedOutput
    And print response

  #Read body data from the file
  Scenario: Post demo 5
    Given path '/users'
    And def requestBody	= read('Request.json')
    And request requestBody
    When method POST
    Then status 201
    And match response == exceptedOutput
    And match $ == exceptedOutput
    And print response

  #Read body data from the file and using the dynamic path
  Scenario: Post demo 6
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def FilePath = projectPath + "\\src\\main\\java\\Data\\Request.json"
    And print FilePath
    # Extract the filename from the FilePath
    And def file = new java.io.File(FilePath)
    And def fileName = file.getName()
    And print fileName
    # Then send the FileName
    And def requestBody = read( fileName )
    And request requestBody
    When method POST
    Then status 201
    And match response == exceptedOutput
    And match $ == exceptedOutput
    And print response

  #Read body data from and change request values in the particular file
  Scenario: Post demo 7
    Given path '/users'
    And def requestBody	= read('UserData.json')
    #print the requestbody
    And print requestBody
    #print the exceptedOutput means read the data from the Response.json
    And print exceptedOutput
    And set requestBody.job = 'Engineer'
    And request requestBody
    When method POST
    Then status 201
    And print response
