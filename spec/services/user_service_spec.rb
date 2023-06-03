require 'rails_helper'

describe 'user service' do
  before(:each) do
    body = {
      user: {
        first_name: 'michael',
        last_name: 'marchand',
        email: 'email',
        password: 'pathword'
      }
    }

    @posted_user = UserService.new.post_user(body)
  end

  describe '#post_user' do
    it 'returns a list of JSON data for a new user' do
      expect(@posted_user).to be_a Hash
      expect(@posted_user).to have_key :data
      expect(@posted_user[:data]).to be_a Hash
      expect(@posted_user[:data]).to have_key :id
      expect(@posted_user[:data]).to have_key :type
      expect(@posted_user[:data][:type]).to eq('user')

      expect(@posted_user[:data][:attributes]).to have_key :id
      expect(@posted_user[:data][:attributes]).to have_key :first_name
      expect(@posted_user[:data][:attributes][:first_name]).to eq('michael')
    end
  end

  describe '#current_user' do
    it 'returns JSON of a user' do
      @user = UserService.new.current_user(@posted_user[:data][:id])
    end
  end

  describe '#add_user_prediction' do
    xit 'returns JSON with user, including new prediction' do
      body = {
        user_id: 14
      }
      response = UserService.new.add_user_prediction(body)

      expect(response).to have_key :data
      expect(response[:data]).to have_key :id
      expect(response[:data]).to have_key :type
      expect(response[:data][:type]).to eq('user')
      expect(response[:data]).to have_key :attributes
      expect(response[:data][:attributes]).to be_a Hash
      expect(response[:data][:attributes]).to have_key :id
      expect(response[:data][:attributes]).to have_key :first_name
      expect(response[:data][:attributes]).to have_key :last_name
      expect(response[:data][:attributes]).to have_key :email
      expect(response[:data][:attributes]).to have_key :predictions
      expect(response[:data][:attributes][:predictions]).to be_an Array

      response[:data][:attributes][:predictions].each do |prediction|
        expect(prediction).to have_key :id
        expect(prediction).to have_key :gamePk
        expect(prediction).to have_key :expected_winner
      end
    end
  end

  describe '#user_predictions' do
    xit 'returns a list of user predictions' do
      known_user_id = 14
      response = UserService.new.user_predictions(known_user_id)

      expect(response).to be_a Hash
      expect(response).to have_key :data
      expect(response[:data][:attributes][:predictions]).to be_an Array

      response[:data][:attributes][:predictions].each do |prediction|
        expect(prediction).to be_a Hash
        expect(prediction).to have_key :id
        expect(prediction).to have_key :gamePk
        expect(prediction).to have_key :user_id
        expect(prediction).to have_key :expected_winner
      end
    end
  end
end
