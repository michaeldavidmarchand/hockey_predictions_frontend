class UsersController < ApplicationController
  def show
    @user = UserFacade.new.current_user(session[:id])
    @user_rank = UserFacade.new.find_rank(session[:id])
  end

  def create
  end
end
