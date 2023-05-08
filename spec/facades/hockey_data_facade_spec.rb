require 'rails_helper'

describe 'HockeyDataFacade' do
  context "#todays_games" do
    it 'returns an Array of HockeyGame objects' do
      todays_games = HockeyDataFacade.new.todays_games
      expect(todays_games).to be_an Array
    end
  end

  context "#single_game_stats" do
    it 'returns a single HockeyGame object' do
      gamePk = 2022030144
      hockey_game = HockeyDataFacade.new.single_game_stats(gamePk)
      expect(hockey_game).to be_a HockeyGame
    end
  end

  context '#add_user_prediction' do
    it 'returns a user with their prediction added' do
      # code kere
    end
  end
end
