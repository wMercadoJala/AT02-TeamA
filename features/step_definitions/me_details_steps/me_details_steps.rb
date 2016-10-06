When(/^I send a (GET) request to MeDetailsGet endpoint$/) do |method|
  require_relative '../../../src/requests/MeDetails/me_details_get'
  @http_response = MeDetailsGet.call_and_return_response(@client, method)
end