class StoriesGet
  def self.call_and_return_response(client, method, project, story)
    end_point = "/projects/#{project}/stories/#{story}"
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    story = Stories.get_parser_project(http_response.body)
    return http_response, story
  end
end