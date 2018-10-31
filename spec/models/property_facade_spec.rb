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

    it '#email' do
      expect(@property_facade.email).to eq("tyler+12@trelora.com")
    end

    it '#phone' do
      expect(@property_facade.phone).to eq("(303)333-3333")
    end

    it '#map' do
      array = expect(@property_facade.map).to eq("Lat: 39.683019, Long: -104.971964")
    end

    it '#opted_in' do
      expect(@property_facade.opted_in).to eq("Yes")
    end

    it '#found_us' do
      expect(@property_facade.found_us).to eq("Google Search")
    end

    it '#zestimate' do
      expect(@property_facade.zestimate).to eq("$704,000")
    end

    it '#z_low' do
      expect(@property_facade.z_low).to eq("$696,000")
    end

    it '#z_high' do
      expect(@property_facade.z_high).to eq("$754,000")
    end

    it '#hj_low' do
      expect(@property_facade.hj_low).to eq("$578,000")
    end

    it '#hj_high' do
      expect(@property_facade.hj_high).to eq("$679,000")
    end

    it '#hj_avg' do
      expect(@property_facade.hj_avg).to eq("$689,000")
    end

    it '#enthusiasm' do
      expect(@property_facade.enthusiasm).to eq("Interested in Moving Forward")
    end

    it '#timing' do
      expect(@property_facade.timing).to eq("Less than 2 Months")
    end

    it '#adopted_type' do
      expect(@property_facade.adopted_type).to eq("Early Adopter")
    end

    it '#updates' do
      expect(@property_facade.updates).to eq(["New Roof in 07/15", "Basement Updated and Finished 8/2016"])
    end

    it '#stage' do
      expect(@property_facade.stage).to eq("Just getting interested in prepping home for sale. Wants to sell and use $$ to buy with us as well.")
    end

    it '#retainer' do
      expect(@property_facade.retainer).to eq(500)
    end
  end
end
