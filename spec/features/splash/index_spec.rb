
RSpec.describe 'Navbar' do
  describe 'leaderboard link' do
    it 'links to the leaderboard page' do
      visit root_path
      expect(current_path).to eq("/")

      expect(page).to have_content('leaderboard')
      click_on "Leaderboard", match: :first
      expect(current_path).to eq leaderboard_index_path
    end
  end
end