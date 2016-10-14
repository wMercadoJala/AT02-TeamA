Given(/^I have created a "(.*)" project$/) do |name_project|
  require_relative '../../../src/requests/Projects/projects_post'
  json = "{ \"name\" : \"#{name_project}\"}"
  http_response_post, @project_name = ProjectsPost.call_and_return_response(@client, 'POST', json)
end

When(/^I send a (GET) request to ProjectGet endpoint to "Test" project$/) do |method|
  require_relative '../../../src/requests/Projects/projects_get'
  @http_response, @project_get = ProjectsGet.call_and_return_response(@client, method, @project_name.id)
end

When(/^I send a (POST) request to ProjectPost endpoint with the (.*) "(\w+)"$/) do |method, attribute, name_project|
  require_relative '../../../src/requests/Projects/projects_post'
  json = "{ \"#{attribute}\" : \"#{name_project}\"}"
  @http_response, @project_name = ProjectsPost.call_and_return_response(@client, method, json)
end

When(/^I send a (POST) request to ProjectPost endpoint with (.*) "(.*)", type "(.*)"$/) do |method, attribute, name_project, type|
  require_relative '../../../src/requests/Projects/projects_post'
  json = "{ \"#{attribute}\" : \"#{name_project}\", \"#{type}\" : true }"
  @http_response, @project_name = ProjectsPost.call_and_return_response(@client, method, json)
end

When(/^I send a (POST) request to ProjectPost endpoint with (.*) has (\d+) characters$/) do |method, attribute, number|
  require_relative '../../../src/requests/Projects/projects_post'
  name_project = 'a' * number.to_i
  json = "{ \"#{attribute}\" : \"#{name_project}\"}"
  @http_response, @project_name = ProjectsPost.call_and_return_response(@client, method, json)
end

When(/^I send a (PUT) request to ProjectPut endpoint change the (.*) to "(.*)"$/) do |method, attribute, name_project|
  require_relative '../../../src/requests/Projects/projects_put'
  json = "{ \"#{attribute}\" : \"#{name_project}\"}"
  @http_response, @project_name = ProjectsPut.call_and_return_response(@client, method, json, @project_name.id)
end

When(/^I send a (PUT) request to ProjectPut endpoint changing the (.*) to "(.*)"$/) do |method, attribute, iteration|
  require_relative '../../../src/requests/Projects/projects_put'
  json = "{ \"#{attribute}\" : #{iteration.to_i}"
  @http_response, @project_name = ProjectsPut.call_and_return_response(@client, method, json, @project_name.id)
end

When(/^I send a (DELETE) request to ProjectDelete endpoint$/) do |method|
  require_relative '../../../src/requests/Projects/projects_delete'
  @http_response = ProjectsDelete.call_and_return_response(@client, method, @project_name.id)
end

Then(/^I expect Status code (\d+) for the Project (.*)$/) do |http_code, method|
  expect(@http_response.code.to_s).to eql(http_code.to_s)
  require_relative '../../../src/requests/Projects/projects_delete'
  ProjectsDelete.call_and_return_response(@client, 'DELETE', @project_name.id) unless method == 'DELETE'
end

Then(/^I expected if response has the attribute project name equal to "(.*)"$/) do |project_name|
  expect(project_name.equal?@project_get.name)
end

Then(/^I expected if response has the attribute project id is a integer$/) do
  expect(@project_get.id.kind_of?(Integer))
end

Then(/^I expected if response has the attribute project start date is DateTime$/) do
  date_time = DateTime.parse(@project_get.start_time)
  expect(date_time.kind_of?(DateTime))
end

Then(/^I expected if response has the attribute project account id is a integer$/) do
  expect(@project_get.account_id.kind_of?(Integer))
end

Then(/^I expected if response has the attribute project iteration length is a integer$/) do
  expect(@project_get.iteration_length.kind_of?(Integer))
end

Then(/^I expected if response has the attribute project kind is equal to "(.*)"$/) do |kind|
  expect(kind.equal?@project_get.kind)
end

Then(/^I expected if response has the attribute project type is equal to "(.*)"$/) do |type|
  expect(type.equal?@project_name.project_type)
end

Then(/^I expected if response has the attribute interaction length is equal to "(.*)"$/) do |interaction|
  expect(interaction.to_i.equal?@project_name.iteration_length)
end

Then(/^I expected if response has the attribute name has (\d+) characters$/) do |number|
  expect(number.to_i.equal?@project_name.name.size)
end

Then(/^I expected if response has the message$/) do |message|
  expect(message.equal?@project_name.requirement)
end



