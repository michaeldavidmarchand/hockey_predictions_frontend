class HockeyDataFacade
  def todays_games
    todays_games = service.todays_games[:data]

    todays_games.map do |game|
      HockeyGame.new(game)
    end
  end

  def service
    HockeyDataService.new
  end
end
