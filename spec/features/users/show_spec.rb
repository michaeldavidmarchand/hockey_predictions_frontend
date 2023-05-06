describe 'Users#show' do
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
    @user = UserFacade.new.current_user(@posted_user[:data][:id])
    page.set_rack_session(id: @user.id)
  end

  context 'show page' do
    it 'shows who\'s dashboard this is' do
      visit "/users/#{@user.id}"
      expect(page).to have_content("#{@user.first_name}'s Dashboard")
    end
  end
end
