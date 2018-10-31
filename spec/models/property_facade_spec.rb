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
      expect(@property_facade.phone).to eq("3033333333")
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
      expect(@property_facade.zestimate).to eq(704000)
    end

    it '#z_low' do
      expect(@property_facade.z_low).to eq(696000)
    end

    it '#z_high' do
      expect(@property_facade.z_high).to eq(754000)
    end

    it '#hj_low' do
      expect(@property_facade.hj_low).to eq(578000)
    end

    it '#hj_high' do
      expect(@property_facade.hj_high).to eq(679000)
    end

    xit '#hj_avg' do
      expect(@property_facade).to eq(679000)
    end

    xit '#enthusiasm' do
      expect(@property_facade).to eq("Tyler Long")
    end

    xit '#timing' do
      expect(@property_facade).to eq("Tyler Long")
    end

    xit '#adopted_type' do
      expect(@property_facade).to eq("Tyler Long")
    end

    xit '#updates' do
      expect(@property_facade).to eq("Tyler Long")
    end

    xit '#stage' do
      expect(@property_facade).to eq("Tyler Long")
    end

    xit '#retainer' do
      500
    end
  end
end
