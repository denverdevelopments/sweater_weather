require 'rails_helper'

describe "Openweather and Mapquest API" do
  it "retrieves current forecast from city-state" do
    city_state = "Houston, TX"
    get "/api/v1/forecast?location=#{city_state}"
    # get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    future = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(future).to be_a(Hash)
    expect(future[:data].count).to eq(3)
    expect(future[:data]).to be_a(Hash)

    expect(future[:data]).to have_key(:id)
    expect(future[:data][:id]).to eq(nil)

    expect(future[:data]).to have_key(:type)
    expect(future[:data][:type]).to eq("forecast")

    expect(future[:data]).to have_key(:attributes)
    expect(future[:data][:attributes]).to be_a(Hash)

    expect(future[:data][:attributes]).to have_key(:id)
    expect(future[:data][:attributes][:id]).to eq(nil)

    expect(future[:data][:attributes]).to have_key(:type)
    expect(future[:data][:attributes][:type]).to eq("forecast")

    expect(future[:data][:attributes]).to have_key(:current_weather)
    expect(future[:data][:attributes][:current_weather]).to be_an(Hash)

    expect(future[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(future[:data][:attributes][:current_weather][:datetime]).to be_an(String)

    expect(future[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(future[:data][:attributes][:current_weather][:sunrise]).to be_an(String)

    expect(future[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(future[:data][:attributes][:current_weather][:sunset]).to be_an(String)

    expect(future[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(future[:data][:attributes][:current_weather][:temperature]).to be_an(Float)

    expect(future[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(future[:data][:attributes][:current_weather][:feels_like]).to be_an(Float)

    expect(future[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(future[:data][:attributes][:current_weather][:humidity]).to be_an(Integer)

    expect(future[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(future[:data][:attributes][:current_weather][:uvi]).to be_an(Integer)

    expect(future[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(future[:data][:attributes][:current_weather][:visibility]).to be_an(Integer)

    expect(future[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(future[:data][:attributes][:current_weather][:conditions]).to be_an(String)

    expect(future[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(future[:data][:attributes][:current_weather][:icon]).to be_an(String)

    expect(future[:data][:attributes][:current_weather]).not_to have_key(:pressure)
  end
end
