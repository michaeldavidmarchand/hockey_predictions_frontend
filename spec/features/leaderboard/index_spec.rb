RSpec.describe 'Leaderboard#index' do
  it 'has a heading of \'Leaderboard\'' do
    visit leaderboard_index_path

    expect(page).to have_content('Leaderboard')
    expect(page).to have_selector('h1', text: 'Leaderboard')
  end
end