class UserFacade
  def all_users
    service.all_users
  end

  def find_rank(session_id)
    all_users = service.all_users
    all_users[:data].find_index { |x| x[:id] == session_id } + 1
  end

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
