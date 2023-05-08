class UsersController < ApplicationController
  def show
    @user = UserFacade.new.current_user(session[:id])
  end

  def create
  end
end
