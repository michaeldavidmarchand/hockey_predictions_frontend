class UserFacade
  def current_user(session_id)
    user = service.current_user(session_id)
    User.new(user)
  end

  def service
    UserService.new
  end
end
