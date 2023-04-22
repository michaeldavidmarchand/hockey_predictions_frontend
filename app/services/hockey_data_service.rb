class HockeyDataService
  def todays_games
    get_url("/api/v1/todays_games")
  end

  def get_url(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://localhost:3000") do |faraday|
      faraday.params['api_key'] = ENV.fetch('tmdb_api_key', nil)
      faraday.params['language'] = 'en-US'
    end
  end
end
