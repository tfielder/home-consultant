require 'rails_helper'

describe 'as a user' do
  describe 'visiting the collect form' do
    before(:each) do
      visit '/'

      fill_in 'user[address]', with: 'steven@trel.co'
      fill_in 'password', with: 'password'

      VCR.use_cassette('testing location search two') do
        click_on 'Log in'
      end

      expect(current_path).to eq("/main_page")

      fill_in "address", with: "1860 south marion st Denver co 80210"

      VCR.use_cassette('find location testing two') do
        click_on "Find Location"
      end
    end
    it 'shows the collect form' do
      expect(page).to have_content('About the Home')
      expect(page).to have_content('Recommended List Price')
      expect(page).to have_content('Update Client Enthusiasm')
      expect(page).to have_content('Buyer Agent Commission')
      expect(page).to have_content('About the Seller')
      expect(page).to have_content('About the Seller')
      expect(page).to have_content('Credit Card Number')
      expect(page).to have_content('Credit Card Expiration Date')
      expect(page).to have_content('Finish')
    end
  end
end