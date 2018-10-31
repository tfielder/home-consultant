require 'rails_helper'


describe PropertyFacade, type: :model do
  describe "instance methods" do
    before(:each) do
      address = "1860_south_marion_street-Denver-CO-80210"
      auth_token = "this_is_a_very_simple_auth_token_string"

      VCR.use_cassette('testing property facade') do
        api_call = PropertyService.new(address, auth_token)


        @property_facade = PropertyFacade.new(api_call.response)
      end
    end
    it '#name' do
      expect(@property_facade.name).to eq("Tyler Long")

    end
  end
end
