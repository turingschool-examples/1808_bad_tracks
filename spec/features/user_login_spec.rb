require 'rails_helper'

describe 'login process' do
  describe 'can login as registered users' do
    before(:each) do
      @username = 'Dr Pepper'
      @password = 'awesomesoda'
      @user = User.create(username: @username, password: @password)
    end
    it 'should succeed if credentials are correct' do
      visit root_path
      click_on 'I already have an account'

      expect(current_path).to eq(login_path)
      fill_in :username, with: @username
      fill_in :password, with: @password
      click_on 'Log In'
      expect(current_path).to eq(user_path(@user))
      expect(page).to have_content("Welcome, #{@username}")
    end

    it 'should fail if credentials are incorrect' do
      visit root_path
      click_on 'I already have an account'

      fill_in :username, with: @username
      fill_in :password, with: 'bad password'
      click_on 'Log In'
      expect(current_path).to eq(login_path)
      expect(page).to have_button("Log In")
      expect(page).to_not have_content("Welcome, #{@username}")
    end

    it 'should fail if credentials are empty' do
      visit root_path
      click_on 'I already have an account'
      # leave the form blank
      click_on 'Log In'
      expect(current_path).to eq(login_path)
      expect(page).to have_button("Log In")
      expect(page).to_not have_content("Welcome, #{@username}")
    end
  end
end
