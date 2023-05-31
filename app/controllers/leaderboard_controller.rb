class LeaderboardController < ApplicationController
  def index
    @users = UserFacade.new.all_users
  end
end
