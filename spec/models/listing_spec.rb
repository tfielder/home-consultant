require 'rails_helper'

describe 'Listing Model' do
  it 'should create a listing' do
    response = { coordinates: {
                   latitude: "39.683019",
                   longitude: "-104.971964"},
                 id: "1860_south_marion_street-Denver-CO-80210",
                 mls: "N/A",
                 home_updates: {
                   exterior: "New Roof in 07/15",
                   interior: "Basement Updated and Finished 8/2016"},
                 address: {
                   address1: "1860 South Marion Street",
                   address2: "",
                   city: "Denver",
                   state: "CO",
                   zip: "80210"},
                 baths: 3,
                 beds: 4}

    listing = Listing.new(response)

    expect(listing.latitude).to eq( response[:coordinates][:latitude])
    expect(listing.longitude).to eq( response[:coordinates][:longitude])
    expect(listing.id).to eq( response[:id])
    expect(listing.mls).to eq( response[:mls])
    expect(listing.interior).to eq( response[:home_updates][:interior])
    expect(listing.exterior).to eq( response[:home_updates][:exterior])
    expect(listing.address_1).to eq( response[:address][:address1])
    expect(listing.address_2).to eq( response[:address][:address2])
    expect(listing.city).to eq( response[:address][:city])
    expect(listing.state).to eq( response[:address][:state])
    expect(listing.zip).to eq( response[:address][:zip])
    expect(listing.baths).to eq( response[:baths])
    expect(listing.beds).to eq( response[:beds])
  end
end
