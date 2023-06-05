class HockeyDataFacade
  def add_user_prediction(data)
    service.add_user_prediction(data)
  end

  def todays_games(date: nil)
    todays_games = service.todays_games(date: date)[:data]

    return [] if todays_games.nil?

    todays_games.map do |game|
      HockeyGame.new(game)
    end
  end

  def single_game_stats(gamePk)
    single_game_stats = service.single_game_stats(gamePk)
    HockeyGame.new(single_game_stats[:data])
  end

  def service
    HockeyDataService.new
  end
end
