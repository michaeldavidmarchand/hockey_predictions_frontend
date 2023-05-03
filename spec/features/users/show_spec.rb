describe 'Users#show' do
  before(:each) do
    @user = double('user')
    allow(@user).to receive(:id).and_return(1)
    allow(@user).to receive(:first_name).and_return("foo")
  end

  context 'show page' do
    it 'shows who\'s dashboard this is' do
      visit "/users/#{@user.id}"
      expect(page).to have_content("#{@user.first_name} dashboard")
    end
  end
end