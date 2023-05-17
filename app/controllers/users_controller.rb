class UsersController < ApplicationController
  before_action :update_predictions, only: :show

  def show
    @user = UserFacade.new.current_user(session[:id])
    @user_rank = UserFacade.new.find_rank(session[:id])
  end

  def create
  end

  private

  def update_predictions
    @user = UserFacade.new.current_user(session[:id])
    UserFacade.new.update_user_predictions(@user)
  end
end
