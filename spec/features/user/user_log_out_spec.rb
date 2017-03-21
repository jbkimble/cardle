require 'rails_helper'

describe 'As a logged in user' do
  it "logs me out when I click 'Logout'", :js => true do
    user = User.create(email: "test@gmail.com", password:"123", password_confirmation: "123", first_name: "Jon", last_initial: "K")

    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/login'
    fill_in "Email", with: "test@gmail.com"
    fill_in "Password", with: "123"
    click_on 'Login'

    expect(page).to have_content('Jon K')

    click_on 'Logout'

    expect(current_path).to eq('/')
    expect(page).to have_content('Successfully logged out!')
  end
end
