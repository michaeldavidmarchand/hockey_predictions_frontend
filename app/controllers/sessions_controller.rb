class SessionsController < ApplicationController
  skip_before_action :current_user

  def omniauth
    user = UserService.new.post_user(user_data)
    session['id'] = user[:data][:id]
    redirect_to user_path(user[:data][:id])
  end

  def destroy
    session[:id] = nil
    flash[:notice] = "You've successfully signed out"
    redirect_to root_path
  end

  private

  def user_data
    request.env['omniauth.auth']['info']
  end
end
