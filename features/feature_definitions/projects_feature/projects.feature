@api_test
Feature: Projects Smoke Tests

  @smoke
  Scenario: Projects Get
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to ProjectGet endpoint
    Then I expect Status code 200 for the SmokeTest

  @smoke
  Scenario: Project Create
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to ProjectPost endpoint with the name New
    Then I expect Status code 200 for the SmokeTest

  @smoke
  Scenario: Project Edit
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to ProjectPut endpoint change the name to Modify
    Then I expect Status code 200 for the SmokeTest

  @smoke
  Scenario: Project Delete
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to ProjectDelete endpoint
    Then I expect Status code 204 for the SmokeTest
