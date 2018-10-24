require 'rails_helper'

describe 'TRELORA API Interface' do
  it 'should exist' do
    trelora = TreloraApiInterface.new
    expect(trelora).to be_a(TreloraApiInterface)
  end

  it 'should complete a successful post' do
    VCR.use_cassette('trelora_post') do
      trelora = TreloraApiInterface.new
      body = { email: 'steven@trel.co',
               password: 'password' }
      response = trelora.post(:members, body)
      expect(response.status).to eq(200)
    end
  end
end
