class ProjectsPut
  def self.call_and_return_response(client, method, json)
    end_point = "/projects/#{$project_id.id}"
    http_request = client.get_request(method, end_point)
    http_request.body = json
    p http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end
end

