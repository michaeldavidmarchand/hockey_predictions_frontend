class HockeyDataService
  def add_user_prediction(data)
    post_url("/api/v1/users/#{data[:user_id]}/predictions", data)
  end

  def todays_games(date: nil)
    get_url("/api/v1/todays_games", date)
  end

  def single_game_stats(gamePk)
    get_url("/api/v1/single_game_stats?gamePk=#{gamePk}")
  end

  def post_url(url, body = nil)
    response = conn.post(url) do |req|
      req.body = body.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_url(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://predictions-be.herokuapp.com") do |faraday|
      # whatever code here
      faraday.headers = { 'Content-Type' => 'application/JSON' }
    end
  end
end
