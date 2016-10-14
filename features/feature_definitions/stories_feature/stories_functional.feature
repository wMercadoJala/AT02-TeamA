@api_test
Feature: Stories Functional Tests

  @functional @name @stories
  Scenario: Story name validation
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
      And I have created a "NewStory" story
    When I send a GET request to StoriesGet endpoint
    Then I expect Status code 200 for the Get request to Stories
      And I expected Response will have the attribute story "name" equal to "NewStory"

  @functional @id @stories
  Scenario: Story id validation
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
      And I have created a "NewStory" story
    When I send a GET request to StoriesGet endpoint
    Then I expect Status code 200 for the Get request to Stories
      And I expected Response will have the attribute story "id" as an "integer"


  @functional @project_id @stories
  Scenario: Story project_id validation
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
      And I have created a "NewStory" story
    When I send a GET request to StoriesGet endpoint
    Then I expect Status code 200 for the Get request to Stories
      And I expected Response will have the attribute story "project_id" as an "integer"

  @functional @requested_by_id @stories
  Scenario: Story requested_by_id validation
    Given I have set a connection to pivotal_tracker API service
     And I have created a "Test" project
     And I have created a "NewStory" story
    When I send a GET request to StoriesGet endpoint
    Then I expect Status code 200 for the Get request to Stories
      And I expected Response will have the attribute story "requested_by_id" as an "integer"

  @functional @name_max_characters @stories
  Scenario: Story name with maximum characters
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
      And I have created a story with "5000" characters in the name
    When I send a GET request to StoriesGet endpoint
    Then I expect Status code 200 for the Get request to Stories
      And I expected Response will have the attribute story "name" with "5000" characters