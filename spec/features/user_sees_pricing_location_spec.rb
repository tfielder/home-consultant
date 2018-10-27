require 'rails_helper'

describe 'as a user' do
  describe 'visiting the pricing location screen' do
    it 'shows the pricing location details' do
      visit '/main_page'

      expect(page).to have_content('Name:')
      expect(page).to have_content('Email:')
      expect(page).to have_content('Phone:')
      expect(page).to have_content('Map:')
      expect(page).to have_content('Opted In:')
      expect(page).to have_content('Found Us:')
      expect(page).to have_content('Estimate:')
      expect(page).to have_content('Enthusiasm:')
      expect(page).to have_content('Timing:')
      expect(page).to have_content('Adopter Type:')
      expect(page).to have_content('Updates:')
      expect(page).to have_content('Stage:')
      expect(page).to have_content('Retainer:')
    end
  end
end