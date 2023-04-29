require 'rails_helper'

describe 'user service' do
  describe '#post_user' do
    it 'returns a list of JSON data for a new user' do
      body = {
        user: {
          first_name: 'michael',
          last_name: 'marchand',
          email: 'email',
          password: 'pathword'
        }
      }

      posted_user = UserService.new.post_user(body)
    end
  end
end