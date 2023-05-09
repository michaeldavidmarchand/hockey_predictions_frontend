class UserService
  def all_users
    get_url("/api/v1/users")
  end

  def update_user_prediction(data)
    patch_url("/api/v1/users/#{data[:user_id]}/predictions/#{data[:id]}", data[:expected_winner])
  end

  def delete_prediction(user_id, id)
    delete_url("/api/v1/users/#{user_id}/predictions/#{id}")
  end

  def user_predictions(user_id)
    get_url("/api/v1/users/#{user_id}/predictions")
  end

  def current_user(session_id)
    get_url("/api/v1/users/#{session_id}")
  end

  def post_user(body)
    post_url("/api/v1/users", body)
  end

  def get_url(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def patch_url(url, body = nil)
    response = conn.patch(url) do |req|
      req.body = { expected_winner: "#{body}" }.to_json
    end
  end

  def post_url(url, body = nil)
    response = conn.post(url) do |req|
      req.body = body.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_url(url, _params = nil)
    response = conn.delete(url)
  end

  def conn
    Faraday.new(url: "http://localhost:3000") do |faraday|
      faraday.headers = { 'Content-Type' => 'application/JSON' }
    end
  end
end
