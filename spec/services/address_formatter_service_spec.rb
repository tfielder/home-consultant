require 'rails_helper'

describe 'AddressFormatter Service' do
  it 'exists' do
    af = AddressFormatter.new("address")

    expect(af).to be_a(AddressFormatter)
  end
  it 'takes a valid raw address and formats for API' do
    address_1 = "1200 E Wilmox St Denver, Colorado 90210"
    address_2 = "20 West Hammock Place Appomattox, Virginia 90210-1001"
    address_3 = "1200 E Wilmox Parkway Sandstone, Texas 90210"
    address_4 = "1860 South Marion ST Denver, Colorado 80210"


    af_1 = AddressFormatter.new(address_1).format
    af_2 = AddressFormatter.new(address_2).format
    af_3 = AddressFormatter.new(address_3).format
    af_4 = AddressFormatter.new(address_4).format

    formatted_1 = "1200_e_wilmox_street-Denver-CO-90210"
    formatted_2 = "20_west_hammock_place-Appomattox-VA-90210"
    formatted_3 = "1200_e_wilmox_parkway-Sandstone-TX-90210"
    formatted_4 = "1860_south_marion_street-Denver-CO-80210"


    expect(af_1).to eq(formatted_1)
    expect(af_2).to eq(formatted_2)
    expect(af_3).to eq(formatted_3)
    expect(af_4).to eq(formatted_4)
  end
end