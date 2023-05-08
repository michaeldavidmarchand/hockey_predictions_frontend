class PredictionsController < ApplicationController
  def index
    @todays_games = HockeyDataFacade.new.todays_games
  end

  def show
    @game_stats = HockeyDataFacade.new.single_game_stats(params[:id])
  end

  def edit
    @game_stats = HockeyDataFacade.new.single_game_stats(params[:gamePk])
  end

  def create
    HockeyDataFacade.new.add_user_prediction(prediction_params)
    redirect_to user_path(prediction_params[:user_id])
  end

  def update
    UserFacade.new.update_user_prediction(prediction_params)
    redirect_to user_path(prediction_params[:user_id])
  end

  def destroy
    UserFacade.new.delete_prediction(params[:user_id], params[:id])
    redirect_to user_path(params[:user_id])
  end

  private

  def prediction_params
    params.permit(:expected_winner, :user_id, :gamePk, :id)
  end
end
