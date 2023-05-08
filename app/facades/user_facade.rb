class UserFacade
  def update_user_prediction(data)
    service.update_user_prediction(data)
  end

  def delete_prediction(user_id, id)
    service.delete_prediction(user_id, id)
  end

  def current_user(session_id)
    user = service.current_user(session_id)
    User.new(user)
  end

  def service
    UserService.new
  end
end
