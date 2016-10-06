class MeDetailsGet
  def self.call_and_return_response(client, method)
    end_point = '/me'
    http_request = client.get_request(method, end_point)
    p http_response = client.execute_request(client.get_connection, http_request)
    http_response 
  end

end