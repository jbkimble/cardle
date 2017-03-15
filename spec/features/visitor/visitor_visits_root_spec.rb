require 'rails_helper'

describe 'As a visitor' do
  scenario 'I visit root and see correct information' do
    visit root_path

    expect(page).to have_content("Welcome To Cardle")
    expect(page).to have_content("Login")
    expect(page).to have_content("Signup")
    expect(page).to_not have_content("Logout")
  end

  xscenario "links me to login path" do
    visit '/'
    click_on("Login")
    expect(current_path).to eq(login_path)
  end

  scenario "links me to signup path" do
    visit '/'
    click_on("Signup")
    expect(current_path).to eq(signup_path)
  end
end
