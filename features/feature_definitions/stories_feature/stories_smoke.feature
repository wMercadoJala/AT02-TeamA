@api_test
Feature: Stories Smoke Tests

  @smoke @get @stories
  Scenario: Stories Get
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
      And I have created a "NewStory" story
    When I send a GET request to StoriesGet endpoint
    Then I expect Status code 200 for the Get request to Stories

  @smoke @post @stories
  Scenario: Stories Create
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
    When I send a POST request to StoriesPost endpoint with the name "NewStory"
    Then I expect Status code 200 for the POST request to Stories

  @smoke @put @stories
  Scenario: Stories Edit
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
      And I have created a "NewStory" story
    When I send a PUT request to StoriesPut endpoint to change the name to "ModifyStory"
    Then I expect Status code 200 for the PUT request to Stories

  @smoke @delete @stories
  Scenario: Stories Delete
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
      And I have created a "NewStory" story
    When I send a DELETE request to StoriesDelete endpoint
    Then I expect Status code 204 for the DELETE request to Stories