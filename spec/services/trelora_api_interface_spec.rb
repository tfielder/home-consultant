require 'rails_helper'

describe 'TRELORA API Interface' do
  it 'should exist' do
    trelora = TreloraApiInterface.new
    expect(trelora).to be_a(TreloraApiInterface)
  end

  it 'should complete a successful member post' do
    VCR.use_cassette('trelora_member_post') do
      trelora = TreloraApiInterface.new
      body = { email:    'steven@trel.co',
               password: 'password' }
      member_response = trelora.post(:members, body)
      expect(member_response.status).to eq(200)
    end
  end
  it 'should complete a successful member post' do
    VCR.use_cassette('trelora_properties_post') do
      trelora = TreloraApiInterface.new
      body = {
                'HTTP_AUTH_TOKEN' => 'this_is_a_very_simple_auth_token_string',
                'address' => '1860_south_marion_street-Denver-CO-80210'
      }
      properties_response = trelora.post(:properties, body)
      expect(properties_response.status).to eq(200)
    end
  end
  it 'should complete a successful update post' do
    VCR.use_cassette('trelora_update_post') do
      trelora = TreloraApiInterface.new
      body = {
                'HTTP_AUTH_TOKEN' => 'this_is_a_very_simple_auth_token_string',
                'address' => '1860_south_marion_street-Denver-CO-80210'
      }
      properties_response = trelora.post(:properties, body)
      expect(properties_response.status).to eq(200)
    end
  end
end
