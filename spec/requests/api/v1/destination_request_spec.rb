require 'rails_helper'

describe "Openweather, Mapquest, Bored API" do
  context "Happy Path" do
    it "retrieves city and current forecast from destination", :vcr do
      city_state = "Houston, TX"
      get "/api/v1/activities?destination=#{city_state}"

      expect(response).to be_successful

      formatted = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(formatted).to be_a(Hash)

      expect(formatted).to have_key(:data)
      expect(formatted[:data]).to be_a(Hash)
      expect(formatted[:data].count).to eq(3)

      expect(formatted[:data]).to have_key(:id)
      expect(formatted[:data][:id]).to eq(nil)

      expect(formatted[:data]).to have_key(:type)
      expect(formatted[:data][:type]).to eq("today")

      expect(formatted[:data]).to have_key(:attributes)
      expect(formatted[:data][:attributes]).to be_a(Hash)

      now = formatted[:data][:attributes]

      expect(now).to have_key(:id)
      expect(now[:id]).to eq(nil)

      expect(now).to have_key(:city)
      expect(now[:city]).to eq("Chicago")

      expect(now).to have_key(:current_weather)
      expect(now[:current_weather]).to be_an(Hash)

      expect(now[:current_weather]).to have_key(:datetime)
      expect(now[:current_weather][:datetime]).to be_an(String)

      expect(now[:current_weather]).to have_key(:sunrise)
      expect(now[:current_weather][:sunrise]).to be_an(String)

      expect(now[:current_weather]).to have_key(:sunset)
      expect(now[:current_weather][:sunset]).to be_an(String)

      expect(now[:current_weather]).to have_key(:temperature)
      expect(now[:current_weather][:temperature]).to be_an(Float)

      expect(now[:current_weather]).to have_key(:feels_like)
      expect(now[:current_weather][:feels_like]).to be_an(Float)

      expect(now[:current_weather]).to have_key(:humidity)
      expect(now[:current_weather][:humidity]).to be_an(Integer)

      expect(now[:current_weather]).to have_key(:uvi)
      expect(now[:current_weather][:uvi]).to be_an(Float)

      expect(now[:current_weather]).to have_key(:visibility)
      expect(now[:current_weather][:visibility]).to be_an(Integer)

      expect(now[:current_weather]).to have_key(:conditions)
      expect(now[:current_weather][:conditions]).to be_an(String)

      expect(now[:current_weather]).to have_key(:icon)
      expect(now[:current_weather][:icon]).to be_an(String)

      expect(now[:current_weather]).not_to have_key(:pressure)
      expect(now[:current_weather]).not_to have_key(:dew_point)
      expect(now[:current_weather]).not_to have_key(:clouds)
      expect(now[:current_weather]).not_to have_key(:wind_speed)
      expect(now[:current_weather]).not_to have_key(:wind_deg)
      expect(now[:current_weather]).not_to have_key(:wind_gust)
    end

    # it "retrieves daily forecasts from city-state", :vcr do
    #   city_state = "Houston, TX"
    #   get "/api/v1/forecast?location=#{city_state}"
    #
    #   expect(response).to be_successful
    #
    #   formatted = JSON.parse(response.body, symbolize_names: true)
    #   # binding.pry
    #   expect(formatted).to be_a(Hash)
    #   expect(formatted[:data].count).to eq(3)
    #   expect(formatted[:data]).to be_a(Hash)
    #
    #   expect(formatted[:data]).to have_key(:id)
    #   expect(formatted[:data][:id]).to eq(nil)
    #
    #   expect(formatted[:data]).to have_key(:type)
    #   expect(formatted[:data][:type]).to eq("forecast")
    #
    #   expect(formatted[:data]).to have_key(:attributes)
    #   expect(formatted[:data][:attributes]).to be_a(Hash)
    #
    #   expect(formatted[:data][:attributes]).to have_key(:id)
    #   expect(formatted[:data][:attributes][:id]).to eq(nil)
    #
    #   expect(formatted[:data][:attributes]).to have_key(:type)
    #   expect(formatted[:data][:attributes][:type]).to eq("forecast")
    #
    #   expect(formatted[:data][:attributes]).to have_key(:daily_weather)
    #   expect(formatted[:data][:attributes][:daily_weather]).to be_an(Array)
    #
    #   days = formatted[:data][:attributes][:daily_weather]
    #
    #   expect(days).to be_a(Array)
    #   expect(days.count).to eq(5)
    #   expect(days.first).to be_a(Hash)
    #
    #   expect(days.first).to have_key(:time)
    #   expect(days.first[:time]).to be_an(String)
    #
    #   expect(days.first).to have_key(:sunrise)
    #   expect(days.first[:sunrise]).to be_an(String)
    #
    #   expect(days.first).to have_key(:sunset)
    #   expect(days.first[:sunset]).to be_an(String)
    #
    #   expect(days.first).to have_key(:max_temp)
    #   expect(days.first[:max_temp]).to be_an(Float)
    #
    #   expect(days.first).to have_key(:min_temp)
    #   expect(days.first[:min_temp]).to be_an(Float)
    #
    #   expect(days.first).to have_key(:conditions)
    #   expect(days.first[:conditions]).to be_an(String)
    #
    #   expect(days.first).to have_key(:icon)
    #   expect(days.first[:icon]).to be_an(String)
    #
    #   expect(days.first).not_to have_key(:moonrise)
    #   expect(days.first).not_to have_key(:moonset)
    #   expect(days.first).not_to have_key(:moon_phase)
    #   expect(days.first).not_to have_key(:feels_like)
    #   expect(days.first).not_to have_key(:pressure)
    #   expect(days.first).not_to have_key(:humidity)
    #   expect(days.first).not_to have_key(:dew_point)
    #   expect(days.first).not_to have_key(:wind_speed)
    #   expect(days.first).not_to have_key(:wind_deg)
    #   expect(days.first).not_to have_key(:wind_gust)
    #   expect(days.first).not_to have_key(:moonrise)
    #   expect(days.first).not_to have_key(:clouds)
    #   expect(days.first).not_to have_key(:pop)
    #   expect(days.first).not_to have_key(:uvi)
    # end
    #
    # it "retrieves hourly forecasts from city-state", :vcr do
    #   city_state = "Houston, TX"
    #   get "/api/v1/forecast?location=#{city_state}"
    #
    #   expect(response).to be_successful
    #
    #   formatted = JSON.parse(response.body, symbolize_names: true)
    #   # binding.pry
    #   expect(formatted).to be_a(Hash)
    #   expect(formatted[:data].count).to eq(3)
    #   expect(formatted[:data]).to be_a(Hash)
    #
    #   expect(formatted[:data]).to have_key(:id)
    #   expect(formatted[:data][:id]).to eq(nil)
    #
    #   expect(formatted[:data]).to have_key(:type)
    #   expect(formatted[:data][:type]).to eq("forecast")
    #
    #   expect(formatted[:data]).to have_key(:attributes)
    #   expect(formatted[:data][:attributes]).to be_a(Hash)
    #
    #   expect(formatted[:data][:attributes]).to have_key(:id)
    #   expect(formatted[:data][:attributes][:id]).to eq(nil)
    #
    #   expect(formatted[:data][:attributes]).to have_key(:type)
    #   expect(formatted[:data][:attributes][:type]).to eq("forecast")
    #
    #   expect(formatted[:data][:attributes]).to have_key(:hourly_weather)
    #   expect(formatted[:data][:attributes][:hourly_weather]).to be_an(Array)
    #
    #   hours = formatted[:data][:attributes][:hourly_weather]
    #
    #   expect(hours).to be_a(Array)
    #   expect(hours.count).to eq(8)
    #   expect(hours.first).to be_a(Hash)
    #
    #   expect(hours.first).to have_key(:time)
    #   expect(hours.first[:time]).to be_an(String)
    #
    #   expect(hours.first).to have_key(:temperature)
    #   expect(hours.first[:temperature]).to be_an(Float)
    #
    #   expect(hours.first).to have_key(:conditions)
    #   expect(hours.first[:conditions]).to be_an(String)
    #
    #   expect(hours.first).to have_key(:icon)
    #   expect(hours.first[:icon]).to be_an(String)
    #
    #   expect(hours.first).not_to have_key(:feels_like)
    #   expect(hours.first).not_to have_key(:pressure)
    #   expect(hours.first).not_to have_key(:humidity)
    #   expect(hours.first).not_to have_key(:dew_point)
    #   expect(hours.first).not_to have_key(:uvi)
    #   expect(hours.first).not_to have_key(:clouds)
    #   expect(hours.first).not_to have_key(:visibility)
    #   expect(hours.first).not_to have_key(:wind_speed)
    #   expect(hours.first).not_to have_key(:wind_deg)
    #   expect(hours.first).not_to have_key(:wind_gust)
    #   expect(hours.first).not_to have_key(:pop)
    # end
  end

  # context "Sad Path" do
  #   it "returns error message if location is empty", :vcr do
  #     city_state = nil
  #     get "/api/v1/forecast?location=#{city_state}"
  #
  #     expect(response).not_to be_successful
  #
  #     formatted = JSON.parse(response.body, symbolize_names: true)
  #     binding.pry
  #     # expect(formatted).to be_a(Hash)
  #   end
  # end
end
