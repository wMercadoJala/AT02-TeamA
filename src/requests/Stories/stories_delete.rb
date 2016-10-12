class StoriesDelete
  def self.call_and_return_response(client, method)
    end_point = "/projects/1652441/stories/#{$story.id}"
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end
end
