class PredictionsController < ApplicationController
  def index
    @todays_games = HockeyDataFacade.new.todays_games
  end

  def show
  end
end
