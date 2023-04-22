require 'rails_helper'

describe 'HockeyDataFacade' do
  context "#todays_games" do
   it 'returns an Array of HockeyGame objects' do
    todays_games = HockeyDataFacade.new.todays_games
   end
  end

end