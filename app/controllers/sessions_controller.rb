class SessionsController < ApplicationController
  def omniauth
    user_data
    user = UserService.new.post_user(user_data)
    session['id'] = user[:data][:id]
    redirect_to predictions_path
  end

  private

  def user_data
    request.env['omniauth.auth']['info']
  end
end
