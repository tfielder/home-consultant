require 'rails_helper'

describe AddressFormatter, type: :model do
  it 'exists' do
    address_1 = "1200 E Wilmox St Denver, Colorado 90210"
    af_1 = AddressFormatter.new(address_1)

    expect(af_1).to be_a(AddressFormatter)
  end
end