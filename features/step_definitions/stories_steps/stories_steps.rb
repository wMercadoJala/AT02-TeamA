Given(/^I have created a "(.*)" story$/) do |name_stories|
  require_relative '../../../src/requests/Stories/stories_post'
  json = "{ \"name\" : \"#{name_stories}\"}"
  # noinspection RubyResolve,RubyResolve,RubyResolve,RubyResolve,RubyResolve,RubyUnusedLocalVariable
  http_response, @story = StoriesPost.call_and_return_response(@client, 'POST', json, @project_name.id)
end

When(/^I send a (GET) request to StoriesGet endpoint$/) do |method|
  require_relative '../../../src/requests/Stories/stories_get'
  # noinspection RubyResolve
  @http_response = StoriesGet.call_and_return_response(@client, method)
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
  expect(@http_response.code.to_s).to eql(http_code.to_s)
  require_relative '../../../src/requests/Projects/projects_delete'
  # noinspection RubyResolve,RubyResolve
  ProjectsDelete.call_and_return_response(@client, 'DELETE', @project_name.id)
end





