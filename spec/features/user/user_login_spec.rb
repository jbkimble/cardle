require 'rails_helper'

describe 'As a user' do
  context "happy path when I visit '/login'" do

    it 'lets me login' do
      user = User.create(email: "test@gmail.com", password:"123", password_confirmation: "123", first_name: "Jon", last_initial: "K")

      visit '/'

      find("#login-button").click
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '123'

      click_on 'Login'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Welcome back Jon!')
      expect(page).to_not have_content('Login')
      expect(page).to_not have_content('Create Account')
      expect(page).to_not have_content('Logout')
    end
  end

  context "Sad path when I visit '/login'" do
    it 'shows me descriptive error messages' do

    end
  end
end
