class SplashController < ApplicationController
  def index
    @todays_games = HockeyDataFacade.new.todays_games
  end
end
