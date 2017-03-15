require 'rails_helper'

describe 'as a visitor' do
  context 'when i visit /signup' do
    it 'shows me a form to enter my information' do
      visit '/signup'
      expect(page).to have_content("Signup!")
      expect(page).to have_content("Email")
      expect(page).to have_content("First name")
      expect(page).to have_content("Last initial")
      expect(page).to have_content("Password")
      expect(page).to have_content("Password Confirmation")
    end
  end
end
