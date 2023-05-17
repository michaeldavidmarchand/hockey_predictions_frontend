class ApplicationController < ActionController::Base
  before_action :current_user

  private

  def current_user
    return if session[:id].nil?

    @current_user = UserFacade.new.current_user(session[:id])
  end

end
