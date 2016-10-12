When(/^I send a (GET) request to StoriesGet endpoint$/) do |method|
  require_relative '../../../src/requests/Stories/stories_get'
  @http_response = StoriesGet.call_and_return_response(@client, method)
end

When(/^I send a (POST) request to StoriesPost endpoint with the (.*) (.*)$/) do |method, attribute, name_stories|
  require_relative '../../../src/requests/Stories/stories_post'
  json = "{ \"#{attribute}\" : \"#{name_stories}\""
  @http_response = StoriesPost.call_and_return_response(@client, method, json)
end

When(/^I send a (PUT) request to StoriesPut endpoint change the (.*) to (.*)$/) do |method, attribute, name_project|
  require_relative '../../../src/requests/Stories/stories_put'
  json = "{ \"#{attribute}\" : \"#{name_project}\""
  @http_response = StoriesPut.call_and_return_response(@client, method, json)
end

When(/^I send a (DELETE) request to StoriesDelete endpoint$/) do |method|
  require_relative '../../../src/requests/Stories/stories_delete'
  @http_response = StoriesDelete.call_and_return_response(@client, method)
end