@api_test
Feature: Workspace Smoke Tests

  @smoke @workspace @get
  Scenario: Workspace Get
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to WorkspacesGet endpoint
    Then I expect Status code 200 for the SmokeTest

  @smoke @workspace @post
  Scenario: Workspace Create
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to WorkspacesPost endpoint with the name NewWorkspace
    Then I expect Status code 200 for the POST request to WorkspacePOST

  @smoke @workspace @put
  Scenario: Workspace Edit
    Given I have set a connection to pivotal_tracker API service
        And I have created a "Test" workspace
        And I have created a "Test" project
    When I send a PUT request to WorkspacesPut endpoint add the project_ids before created
    Then I expect Status code 200 for the PUT request to WorkspacePUT

  @smoke @workspace @delete
  Scenario: Workspace Delete
    Given I have set a connection to pivotal_tracker API service
        And I have created a "Test" workspace
    When I send a DELETE request to WorkspacesDelete endpoint
    Then I expect Status code 204 for the SmokeTest
