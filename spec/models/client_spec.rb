require 'rails_helper'

describe 'CLient Model' do
  it 'should create_a_client' do
    name         = 'Tyler Long'
    email        = 'tyler+12@trelora.com'
    phone        = '3033333333'
    found_us     = 'Google Search'
    enthusiasm   = 'Interested in Moving Forward'
    timing       = 'Less than 2 Months'
    adopter_type = 'Early Adopter'
    stage        = 'Just getting interested in prepping home for sale. Wants to
                    sell and use $$ to buy with us as well.'
    response = {
                  client_info: {
                    name:  name,
                    email: email,
                    phone: phone},
                  opted_in: {
                    result: true},
                  found_us:     found_us,
                  enthusiasm:   enthusiasm,
                  timing:       timing,
                  adopter_type: adopter_type,
                  stage:        stage }

    client = Client.new(response)

    expect( client.name         ).to eq( name )
    expect( client.email        ).to eq( email )
    expect( client.phone        ).to eq( phone )
    expect( client.opted_in     ).to eq( true )
    expect( client.found_us     ).to eq( found_us )
    expect( client.enthusiasm   ).to eq( enthusiasm )
    expect( client.timing       ).to eq( timing )
    expect( client.adopter_type ).to eq( adopter_type )
    expect( client.stage        ).to eq( stage )

  end
end
