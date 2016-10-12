class StoriesPost
  def self.call_and_return_response(client, method, json, project)
    require_relative '../../../src/data/stories'
    end_point = "/projects/#{project}/stories/"
    http_request = client.get_request(method, end_point)
    http_request.body = json
    http_response = client.execute_request(client.get_connection, http_request)
    story = Stories.get_parser_project(http_response.body)
    return http_response, story
  end
end