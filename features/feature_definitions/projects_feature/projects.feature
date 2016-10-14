@api_test
Feature: Projects Smoke Tests

  @smoke @project @get
  Scenario: Projects Get
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
    When I send a GET request to ProjectGet endpoint to "Test" project
    Then I expect Status code 200 for the Project GET

  @smoke @project @post
  Scenario: Project Create
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to ProjectPost endpoint with the name "NewProject"
    Then I expect Status code 200 for the Project Create

  @smoke @project @put
  Scenario: Project Edit
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
    When I send a PUT request to ProjectPut endpoint change the name to "Modify"
    Then I expect Status code 200 for the Project Edit


  @smoke @project @delete
  Scenario: Project Delete
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
    When I send a DELETE request to ProjectDelete endpoint
    Then I expect Status code 204 for the Project DELETE

  @project @functional
  Scenario: Project validation
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
    When I send a GET request to ProjectGet endpoint to "Test" project
    Then I expect Status code 200 for the Project GET
      And I expected if response has the attribute project name equal to "Test"
      And I expected if response has the attribute project id is a integer
      And I expected if response has the attribute project start date is DateTime
      And I expected if response has the attribute project account id is a integer
      And I expected if response has the attribute project iteration length is a integer
      And I expected if response has the attribute project kind is equal to "project"

  @project @post @functional
  Scenario: Project Create
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to ProjectPost endpoint with name "NewProject", type "public"
    Then I expect Status code 200 for the Project Create
      And I expected if response has the attribute project type is equal to "public"

  @project @post @functional
  Scenario: Project Edit
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
    When I send a PUT request to ProjectPut endpoint changing the iteration_length to "2"
    Then I expect Status code 200 for the Project Edit
      And I expected if response has the attribute interaction length is equal to "2"

  @project @post @negative
  Scenario: Project Create
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to ProjectPost endpoint with name has 51 characters
    Then I expect Status code 400 for the Project Create
      And I expected if response has the message
  """
  'name' parameter must be 50 characters or less.
  """