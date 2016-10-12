class StoriesPost
  def self.call_and_return_response(client, method, json)
    require_relative '../../../src/data/stories'
    end_point = '/projects/1652441/stories/'
    http_request = client.get_request(method, end_point)
    http_request.body = json
    http_response = client.execute_request(client.get_connection, http_request)
    $story = Stories.get_parser_project(http_response.body)
    http_response
  end
end