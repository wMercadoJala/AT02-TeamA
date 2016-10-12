@api_test
Feature: Stories Smoke Tests

  @smoke @get
  Scenario: Stories Get
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to StoriesGet endpoint
    Then I expect Status code 200 for the SmokeTest

  @smoke @post
  Scenario: Stories Create
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
    When I send a POST request to StoriesPost endpoint with the name "NewStory"
    Then I expect Status code 200 for the POST request to Stories

  @smoke @put
  Scenario: Stories Edit
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
      And I have created a "NewStory" story
    When I send a PUT request to StoriesPut endpoint change the name to "ModifyStory"
    Then I expect Status code 200 for the PUT request to Stories

  @smoke @delete
  Scenario: Stories Delete
    Given I have set a connection to pivotal_tracker API service
      And I have created a "Test" project
      And I have created a "NewStory" story
    When I send a DELETE request to StoriesDelete endpoint
    Then I expect Status code 204 for the DELETE request to Stories