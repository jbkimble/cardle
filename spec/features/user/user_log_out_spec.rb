require 'rails_helper'

describe 'As a logged in user' do
  scenario "clicking 'Logout' logs me out" do
    user = User.create(email: "test@gmail.com", password:"123", password_confirmation: "123", first_name: "Jon", last_initial: "K")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    click_on 'Logout'

    expect(current_path).to eq('/')
    expect(page).to have_content('Successfully logged out!', visible: true)

  end
end
