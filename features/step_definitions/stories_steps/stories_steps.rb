Given(/^I have created a "(.*)" story$/) do |name_stories|
  require_relative '../../../src/requests/Stories/stories_post'
  json = "{ \"name\" : \"#{name_stories}\"}"
  # noinspection RubyResolve,RubyResolve,RubyResolve,RubyResolve,RubyResolve,RubyUnusedLocalVariable
  http_response, @story = StoriesPost.call_and_return_response(@client, 'POST', json, @project_name.id)
end

Given(/^I have created a story with "(.*)" characters in the name$/) do |number|
  require_relative '../../../src/requests/Stories/stories_post'
  name_story = 'a' * number.to_i
  json = "{ \"name\" : \"#{name_story}\"}"
  # noinspection RubyResolve,RubyResolve,RubyResolve,RubyResolve,RubyResolve,RubyUnusedLocalVariable
  http_response, @story = StoriesPost.call_and_return_response(@client, 'POST', json, @project_name.id)
end

When(/^I send a (GET) request to StoriesGet endpoint$/) do |method|
  require_relative '../../../src/requests/Stories/stories_get'
  # noinspection RubyResolve
  @http_response, @story = StoriesGet.call_and_return_response(@client, method, @project_name.id, @story.id)
end

When(/^I send a (POST) request to StoriesPost endpoint with the (.*) "(.*)"$/) do |method, attribute, name_stories|
  require_relative '../../../src/requests/Stories/stories_post'
  json = "{ \"#{attribute}\" : \"#{name_stories}\""
  # noinspection RubyResolve,RubyResolve
  @http_response, @story = StoriesPost.call_and_return_response(@client, method, json, @project_name.id)
end

When(/^I send a (PUT) request to StoriesPut endpoint to change the (.*) to "(.*)"$/) do |method, attribute, name_project|
  require_relative '../../../src/requests/Stories/stories_put'
  json = "{ \"#{attribute}\" : \"#{name_project}\""
  # noinspection RubyResolve
  @http_response = StoriesPut.call_and_return_response(@client, method, json, @story.id, @project_name.id)
end

When(/^I send a (DELETE) request to StoriesDelete endpoint$/) do |method|
  require_relative '../../../src/requests/Stories/stories_delete'
  # noinspection RubyResolve,RubyResolve,RubyResolve,RubyResolve,RubyResolve,RubyResolve
  @http_response = StoriesDelete.call_and_return_response(@client, method, @story.id, @project_name.id)
end

# noinspection RubyUnusedLocalVariable
Then(/^I expect Status code (\d+) for the (.*) request to Stories$/) do |http_code, method|
  expect(@http_response.code.to_s).to eq(http_code.to_s)
  require_relative '../../../src/requests/Projects/projects_delete'
  # noinspection RubyResolve,RubyResolve
  ProjectsDelete.call_and_return_response(@client, 'DELETE', @project_name.id)
end

Then(/^I expected Response will have the attribute story "name" equal to "(.*)"$/) do |name_stories|
  expect(@story.name).to eq(name_stories)
end

Then(/^I expected Response will have the attribute story "name" with "(.*)" characters$/) do |number|
  expect(@story.name.size).to eq(number.to_i)
end

Then(/^I expected Response will have the attribute story "id" as an "integer"$/) do
  expect(@story.id.kind_of?(Integer))
end

Then(/^I expected Response will have the attribute story "project_id" as an "integer"$/) do
  expect(@story.project_id.kind_of?(Integer))
end

Then(/^I expected Response will have the attribute story "requested_by_id" as an "integer"$/) do
  expect(@story.requested_by_id.kind_of?(Integer))
end