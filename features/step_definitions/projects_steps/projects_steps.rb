When(/^I send a (GET) request to ProjectGet endpoint$/) do |method|
  require_relative '../../../src/requests/Projects/projects_get'
  @http_response = ProjectsGet.call_and_return_response(@client, method)
end

When(/^I send a (POST) request to ProjectPost endpoint with the (.*) (.*)$/) do |method, attribute, name_project|
  require_relative '../../../src/requests/Projects/projects_post'
  json = "{ \"#{attribute}\" : \"#{name_project}\"}"
  @http_response = ProjectsPost.call_and_return_response(@client, method, json)
end

When(/^I send a (PUT) request to ProjectPut endpoint change the (.*) to (.*)$/) do |method, attribute, name_project|
  require_relative '../../../src/requests/Projects/projects_put'
  json = "{ \"#{attribute}\" : \"#{name_project}\"}"
  @http_response = ProjectsPut.call_and_return_response(@client, method, json)
end

When(/^I send a (DELETE) request to ProjectDelete endpoint$/) do |method|
  require_relative '../../../src/requests/Projects/projects_delete'
  @http_response = ProjectsDelete.call_and_return_response(@client, method)
end


