Given(/^I have created a "(.*)" workspace$/) do |name_workspace|
  require_relative '../../../src/requests/Workspaces/workspaces_post'
  json = "{ \"name\" : \"#{name_workspace}\"}"
  @http_response, @workspace = WorkspacesPost.call_and_return_response(@client, 'POST', json)
end

When(/^I send a (GET) request to WorkspacesGet endpoint$/) do |method|
  require_relative '../../../src/requests/Workspaces/workspaces_get'
  @http_response = WorkspacesGet.call_and_return_response(@client, method)
end

When(/^I send a (POST) request to WorkspacesPost endpoint with the (.*) (.*)$/) do |method, attribute, name|
  require_relative '../../../src/requests/Workspaces/workspaces_post'
  json = "{ \"#{attribute}\" : \"#{name}\"}"
  @http_response, @workspace = WorkspacesPost.call_and_return_response(@client, method, json)
end

When(/^I send a (PUT) request to WorkspacesPut endpoint add the (.*) before created$/) do |method, attribute|
  require_relative '../../../src/requests/Workspaces/workspaces_put'
  json = "{ \"#{attribute}\" : [#{@project_name.id}]}"
  @http_response = WorkspacesPut.call_and_return_response(@client, method, json, @workspace.id)
end

When(/^I send a (DELETE) request to WorkspacesDelete endpoint$/) do |method|
  require_relative '../../../src/requests/Workspaces/workspaces_delete'
  @http_response = WorkspacesDelete.call_and_return_response(@client, method, @workspace.id)
end

Then(/^I expect Status code (\d+) for the POST request to WorkspacePOST$/) do |http_code|
  require_relative '../../../src/requests/Workspaces/workspaces_delete'
  expect(@http_response.code.to_s).to eql(http_code.to_s)
  WorkspacesDelete.call_and_return_response(@client, 'DELETE', @workspace.id)
end

Then(/^I expect Status code (\d+) for the PUT request to WorkspacePUT$/) do |http_code|
  require_relative '../../../src/requests/Workspaces/workspaces_delete'
  require_relative '../../../src/requests/Projects/projects_delete'
  expect(@http_response.code.to_s).to eql(http_code.to_s)
  WorkspacesDelete.call_and_return_response(@client, 'DELETE', @workspace.id)
  ProjectsDelete.call_and_return_response(@client, 'DELETE', @project_name.id)
end







