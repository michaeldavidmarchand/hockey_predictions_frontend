class SessionsController < ApplicationController
  skip_before_action :current_user

  def omniauth
    user_data
    user = UserService.new.post_user(user_data)
    session['id'] = user[:data][:id]
    redirect_to user_path(user[:data][:id])
  end

  private

  def user_data
    request.env['omniauth.auth']['info']
  end
end
