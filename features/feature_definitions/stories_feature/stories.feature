@api_test
Feature: Stories Smoke Tests

  @smoke
  Scenario: Stories Get
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to StoriesGet endpoint
    Then I expect Status code 200 for the SmokeTest

  @smoke
  Scenario: Stories Create
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to StoriesPost endpoint with the name NewStory
    Then I expect Status code 200 for the SmokeTest

  @smoke
  Scenario: Stories Edit
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to StoriesPut endpoint change the name to ModifyStory
    Then I expect Status code 200 for the SmokeTest

  @smoke
  Scenario: Stories Delete
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to StoriesDelete endpoint
    Then I expect Status code 204 for the SmokeTest