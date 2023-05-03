class PredictionsController < ApplicationController
  def index
    @todays_games = HockeyDataFacade.new.todays_games
  end

  def show
    @game_stats = HockeyDataFacade.new.single_game_stats(params[:id])
  end

  def create
    HockeyDataFacade.new.add_user_prediction(prediction_params)
    redirect_to user_path(prediction_params[:user_id])
  end

  private

  def prediction_params
    params.permit(:expected_winner, :user_id, :gamePk)
  end
end
