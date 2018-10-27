require 'rails_helper'

describe 'Pricing Estimates Service' do
  it 'should create a pricing_estimate' do
    response = { zillow: {
                 zestimate: 704000,
                 low: 696000,
                 high: 754000
                },
               home_junction: {
                low: 578000,
                high: 679000,
                regional_avg: 689000
            } }

    pricing = PricingEstimates.new( response )

    expect( pricing.zestimate ).to eq( response[:zillow][:zestimate] )
    expect( pricing.zest_low       ).to eq( response[:zillow][:low] )
    expect( pricing.zest_high      ).to eq( response[:zillow][:high] )
    expect( pricing.hj_low         ).to eq( response[:home_junction][:low] )
    expect( pricing.hj_high        ).to eq( response[:home_junction][:high] )
    expect( pricing.hj_regional_avg).to eq( response[:home_junction][:regional_avg])
  end
end
