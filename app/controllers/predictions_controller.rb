class PredictionsController < ApplicationController
  def index
    @todays_games = HockeyDataFacade.new.todays_games
  end

  def show
    @game_stats = HockeyDataFacade.new.single_game_stats(params[:id])
  end
end
