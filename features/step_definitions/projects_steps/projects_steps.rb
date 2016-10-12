Given(/^I have created a "(.*)" project$/) do |name_project|
  require_relative '../../../src/requests/Projects/projects_post'
  json = "{ \"name\" : \"#{name_project}\"}"
  @http_response_post, @project_name = ProjectsPost.call_and_return_response(@client, 'POST', json)
end

When(/^I send a (GET) request to ProjectGet endpoint$/) do |method|
  require_relative '../../../src/requests/Projects/projects_get'
  @http_response = ProjectsGet.call_and_return_response(@client, method)
end

When(/^I send a (POST) request to ProjectPost endpoint with the (.*) "(.*)"$/) do |method, attribute, name_project|
  require_relative '../../../src/requests/Projects/projects_post'
  json = "{ \"#{attribute}\" : \"#{name_project}\"}"
  @http_response, @project_name = ProjectsPost.call_and_return_response(@client, method, json)

end

When(/^I send a (PUT) request to ProjectPut endpoint change the (.*) to "(.*)"$/) do |method, attribute, name_project|
  require_relative '../../../src/requests/Projects/projects_put'
  json = "{ \"#{attribute}\" : \"#{name_project}\"}"
  @http_response = ProjectsPut.call_and_return_response(@client, method, json, @project_name.id)
end

When(/^I send a (DELETE) request to ProjectDelete endpoint$/) do |method|
  require_relative '../../../src/requests/Projects/projects_delete'
  @http_response = ProjectsDelete.call_and_return_response(@client, method, @project_name.id)
end


Then(/^I expect Status code (\d+) for the (.*) SmokeTest$/) do |http_code, method|
  expect(@http_response.code.to_s).to eql(http_code.to_s)
  require_relative '../../../src/requests/Projects/projects_delete'
  ProjectsDelete.call_and_return_response(@client, 'DELETE', @project_name.id) unless method == 'DELETE'
end

