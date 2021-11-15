require 'rails_helper'

RSpec.describe MapquestService do
  it "can get location details", :vcr do
    city_state = "Denver, CO"
    response = MapquestService.find_coordinates(city_state)

    expect(response).to be_a Hash

    expect(response).to have_key :info
    expect(response[:info]).to be_a(Hash)

    expect(response).to have_key :options
    expect(response[:options]).to be_a(Hash)

    expect(response).to have_key :results
    expect(response[:results]).to be_a(Array)
  end

  it "can get a location longitude and latitude", :vcr do
    city_state = "Denver, CO"
    response = MapquestService.find_coordinates(city_state)

    locale_info = response[:results][0][:locations].first

    expect(locale_info).to be_a Hash

    expect(locale_info).to have_key :latLng
    expect(locale_info[:latLng]).to be_a(Hash)

    expect(locale_info[:latLng]).to have_key :lat
    expect(locale_info[:latLng][:lat]).to be_a(Float)

    expect(locale_info[:latLng]).to have_key :lng
    expect(locale_info[:latLng][:lng]).to be_a(Float)
  end
end
