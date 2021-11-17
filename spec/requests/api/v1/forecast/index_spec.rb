require 'rails_helper'

describe "Openweather and Mapquest API forecast index" do
  context "Happy Path" do
    it "retrieves current forecast from city-state", :vcr do
      city_state = "Houston, TX"
      get "/api/v1/forecast?location=#{city_state}"

      expect(response).to be_successful

      formatted = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(formatted).to be_a(Hash)
      expect(formatted[:data].count).to eq(3)
      expect(formatted[:data]).to be_a(Hash)

      expect(formatted[:data]).to have_key(:id)
      expect(formatted[:data][:id]).to eq(nil)

      expect(formatted[:data]).to have_key(:type)
      expect(formatted[:data][:type]).to eq("forecast")

      expect(formatted[:data]).to have_key(:attributes)
      expect(formatted[:data][:attributes]).to be_a(Hash)

      expect(formatted[:data][:attributes]).to have_key(:id)
      expect(formatted[:data][:attributes][:id]).to eq(nil)

      expect(formatted[:data][:attributes]).to have_key(:type)
      expect(formatted[:data][:attributes][:type]).to eq("forecast")

      expect(formatted[:data][:attributes]).to have_key(:current_weather)
      expect(formatted[:data][:attributes][:current_weather]).to be_an(Hash)

      now = formatted[:data][:attributes][:current_weather]

      expect(now).to have_key(:datetime)
      expect(now[:datetime]).to be_an(String)

      expect(now).to have_key(:sunrise)
      expect(now[:sunrise]).to be_an(String)

      expect(now).to have_key(:sunset)
      expect(now[:sunset]).to be_an(String)

      expect(now).to have_key(:temperature)
      expect(now[:temperature]).to be_an(Float)

      expect(now).to have_key(:feels_like)
      expect(now[:feels_like]).to be_an(Float)

      expect(now).to have_key(:humidity)
      expect(now[:humidity]).to be_an(Integer)

      expect(now).to have_key(:uvi)
      expect(now[:uvi]).to be_an(Integer)

      expect(now).to have_key(:visibility)
      expect(now[:visibility]).to be_an(Integer)

      expect(now).to have_key(:conditions)
      expect(now[:conditions]).to be_an(String)

      expect(now).to have_key(:icon)
      expect(now[:icon]).to be_an(String)

      expect(now).not_to have_key(:pressure)
      expect(now).not_to have_key(:dew_point)
      expect(now).not_to have_key(:clouds)
      expect(now).not_to have_key(:wind_speed)
      expect(now).not_to have_key(:wind_deg)
      expect(now).not_to have_key(:wind_gust)
    end

    it "retrieves daily forecasts from city-state", :vcr do
      city_state = "Houston, TX"
      get "/api/v1/forecast?location=#{city_state}"

      expect(response).to be_successful

      formatted = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(formatted).to be_a(Hash)
      expect(formatted[:data].count).to eq(3)
      expect(formatted[:data]).to be_a(Hash)

      expect(formatted[:data]).to have_key(:id)
      expect(formatted[:data][:id]).to eq(nil)

      expect(formatted[:data]).to have_key(:type)
      expect(formatted[:data][:type]).to eq("forecast")

      expect(formatted[:data]).to have_key(:attributes)
      expect(formatted[:data][:attributes]).to be_a(Hash)

      expect(formatted[:data][:attributes]).to have_key(:id)
      expect(formatted[:data][:attributes][:id]).to eq(nil)

      expect(formatted[:data][:attributes]).to have_key(:type)
      expect(formatted[:data][:attributes][:type]).to eq("forecast")

      expect(formatted[:data][:attributes]).to have_key(:daily_weather)
      expect(formatted[:data][:attributes][:daily_weather]).to be_an(Array)

      days = formatted[:data][:attributes][:daily_weather]

      expect(days).to be_a(Array)
      expect(days.count).to eq(5)
      expect(days.first).to be_a(Hash)

      expect(days.first).to have_key(:time)
      expect(days.first[:time]).to be_an(String)

      expect(days.first).to have_key(:sunrise)
      expect(days.first[:sunrise]).to be_an(String)

      expect(days.first).to have_key(:sunset)
      expect(days.first[:sunset]).to be_an(String)

      expect(days.first).to have_key(:max_temp)
      expect(days.first[:max_temp]).to be_an(Float)

      expect(days.first).to have_key(:min_temp)
      expect(days.first[:min_temp]).to be_an(Float)

      expect(days.first).to have_key(:conditions)
      expect(days.first[:conditions]).to be_an(String)

      expect(days.first).to have_key(:icon)
      expect(days.first[:icon]).to be_an(String)

      expect(days.first).not_to have_key(:moonrise)
      expect(days.first).not_to have_key(:moonset)
      expect(days.first).not_to have_key(:moon_phase)
      expect(days.first).not_to have_key(:feels_like)
      expect(days.first).not_to have_key(:pressure)
      expect(days.first).not_to have_key(:humidity)
      expect(days.first).not_to have_key(:dew_point)
      expect(days.first).not_to have_key(:wind_speed)
      expect(days.first).not_to have_key(:wind_deg)
      expect(days.first).not_to have_key(:wind_gust)
      expect(days.first).not_to have_key(:moonrise)
      expect(days.first).not_to have_key(:clouds)
      expect(days.first).not_to have_key(:pop)
      expect(days.first).not_to have_key(:uvi)
    end

    it "retrieves hourly forecasts from city-state", :vcr do
      city_state = "Houston, TX"
      get "/api/v1/forecast?location=#{city_state}"

      expect(response).to be_successful

      formatted = JSON.parse(response.body, symbolize_names: true)

      expect(formatted).to be_a(Hash)
      expect(formatted[:data].count).to eq(3)
      expect(formatted[:data]).to be_a(Hash)

      expect(formatted[:data]).to have_key(:id)
      expect(formatted[:data][:id]).to eq(nil)

      expect(formatted[:data]).to have_key(:type)
      expect(formatted[:data][:type]).to eq("forecast")

      expect(formatted[:data]).to have_key(:attributes)
      expect(formatted[:data][:attributes]).to be_a(Hash)

      expect(formatted[:data][:attributes]).to have_key(:id)
      expect(formatted[:data][:attributes][:id]).to eq(nil)

      expect(formatted[:data][:attributes]).to have_key(:type)
      expect(formatted[:data][:attributes][:type]).to eq("forecast")

      expect(formatted[:data][:attributes]).to have_key(:hourly_weather)
      expect(formatted[:data][:attributes][:hourly_weather]).to be_an(Array)

      hours = formatted[:data][:attributes][:hourly_weather]

      expect(hours).to be_a(Array)
      expect(hours.count).to eq(8)
      expect(hours.first).to be_a(Hash)

      expect(hours.first).to have_key(:time)
      expect(hours.first[:time]).to be_an(String)

      expect(hours.first).to have_key(:temperature)
      expect(hours.first[:temperature]).to be_an(Float)

      expect(hours.first).to have_key(:conditions)
      expect(hours.first[:conditions]).to be_an(String)

      expect(hours.first).to have_key(:icon)
      expect(hours.first[:icon]).to be_an(String)

      expect(hours.first).not_to have_key(:feels_like)
      expect(hours.first).not_to have_key(:pressure)
      expect(hours.first).not_to have_key(:humidity)
      expect(hours.first).not_to have_key(:dew_point)
      expect(hours.first).not_to have_key(:uvi)
      expect(hours.first).not_to have_key(:clouds)
      expect(hours.first).not_to have_key(:visibility)
      expect(hours.first).not_to have_key(:wind_speed)
      expect(hours.first).not_to have_key(:wind_deg)
      expect(hours.first).not_to have_key(:wind_gust)
      expect(hours.first).not_to have_key(:pop)
    end
  end

  context "Sad Path" do
    it "returns error message if location is empty", :vcr do
      city_state = nil
      get "/api/v1/forecast?location=#{city_state}"

      expect(response).not_to be_successful
      expect(response.status).to eq(404)

      formatted = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(formatted).to be_a(Hash)
      expect(formatted[:status]).to eq("not_found")
      expect(formatted[:code]).to eq(404)
      expect(formatted[:message]).to eq("Invalid Input")
    end

    it "returns error message if location is an integer", :vcr do
      city_state = 12
      get "/api/v1/forecast?location=#{city_state}"

      expect(response).not_to be_successful
      expect(response.status).to eq(404)

      formatted = JSON.parse(response.body, symbolize_names: true)

      expect(formatted).to be_a(Hash)
      expect(formatted[:status]).to eq("not_found")
      expect(formatted[:code]).to eq(404)
      expect(formatted[:message]).to eq("Invalid Input")
    end

    it "returns error message if location is a float", :vcr do
      city_state = 34.5
      get "/api/v1/forecast?location=#{city_state}"

      expect(response).not_to be_successful
      expect(response.status).to eq(404)

      formatted = JSON.parse(response.body, symbolize_names: true)

      expect(formatted).to be_a(Hash)
      expect(formatted[:status]).to eq("not_found")
      expect(formatted[:code]).to eq(404)
      expect(formatted[:message]).to eq("Invalid Input")
    end
  end
end
