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
    end
  end

  describe '#current_user' do
    it 'returns JSON of a user' do
      @user = UserService.new.current_user(@posted_user[:data][:id])
    end
  end
end
