require 'rails_helper'

describe 'HockeyDataService' do
  describe '#todays_games' do
    it 'returns a list of games for today as JSON' do
      todays_games = HockeyDataService.new.todays_games
      expect(todays_games).to be_a Hash
      expect(todays_games).to have_key :data
      expect(todays_games[:data]).to be_an Array

      todays_games[:data].each do |game_hash|
        expect(game_hash).to have_key :attributes
        expect(game_hash[:attributes]).to be_a Hash
        expect(game_hash[:attributes]).to have_key :gamePk
        expect(game_hash[:attributes]).to have_key :abstractGameState
        expect(game_hash[:attributes]).to have_key :codedGameState
        expect(game_hash[:attributes]).to have_key :detailedState
        expect(game_hash[:attributes]).to have_key :statusCode
        expect(game_hash[:attributes]).to have_key :home
        expect(game_hash[:attributes]).to have_key :away
        expect(game_hash[:attributes]).to have_key :home_score
        expect(game_hash[:attributes]).to have_key :away_score
        expect(game_hash[:attributes]).to have_key :winner
      end
    end

  end
end
