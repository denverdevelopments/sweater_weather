require 'rails_helper'

describe "Mapquest API" do
  it "retrieves coordinates from city-state" do
    city_state = "denver,co"
    get "/api/v1/forecast?location=#{city_state}"
    # get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    location = JSON.parse(response.body, symbolize_names: true)
    # binding.pry

    expect(location).to be_a(Hash)
    expect(location[:data].count).to eq(3)
    expect(location[:data]).to be_a(Hash)

    expect(location[:data]).to have_key(:id)
    expect(location[:data][:id]).to be_an(String)

    expect(location[:data]).to have_key(:attributes)
    expect(location[:data][:attributes]).to be_a(Hash)

    expect(location[:data][:attributes]).to have_key(:id)
    expect(location[:data][:attributes][:id]).to be_an(Integer)

    expect(location[:data][:attributes]).to have_key(:lat)
    expect(location[:data][:attributes][:lat]).to be_an(Float)

    expect(location[:data][:attributes]).to have_key(:long)
    expect(location[:data][:attributes][:long]).to be_an(Float)

    expect(location[:data][:attributes]).to have_key(:city)
    expect(location[:data][:attributes][:city]).to be_an(String)

    expect(location[:data][:attributes]).to have_key(:state)
    expect(location[:data][:attributes][:state]).to be_an(String)

  end
end
