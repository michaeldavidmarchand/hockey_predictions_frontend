class SplashController < ApplicationController
  before_action :logged_in

  def index
  end

  private

  def logged_in
    return if session[:id].nil?

    redirect_to user_path(session[:id])
  end
end
