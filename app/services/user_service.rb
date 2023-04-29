class UserService
  def post_user(body)
    post_url("/api/v1/users", body)
  end

  def post_url(url, body = nil)
    response = conn.post(url) do |req|
      req.body = body.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://localhost:3000") do |faraday|
      faraday.headers = { 'Content-Type' => 'application/JSON' }
    end
  end
end
