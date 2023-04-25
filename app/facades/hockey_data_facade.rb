class HockeyDataFacade
  def todays_games
    todays_games = service.todays_games[:data]

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
