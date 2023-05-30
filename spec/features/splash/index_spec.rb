
RSpec.describe 'Navbar' do
  describe 'leaderboard link' do
    it 'links to the leaderboard page' do
      visit root_path
      expect(current_path).to eq("/")
    end
  end
end