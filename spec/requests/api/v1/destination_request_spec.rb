require 'rails_helper'

describe "Openweather, Mapquest, Bored API" do
  context "Happy Path" do
    it "retrieves city and current forecast from destination", :vcr do
      city_state = "Houston, TX"
      get "/api/v1/activities?destination=#{city_state}"

      expect(response).to be_successful

      formatted = JSON.parse(response.body, symbolize_names: true)

      expect(formatted).to be_a(Hash)

      expect(formatted).to have_key(:data)
      expect(formatted[:data]).to be_a(Hash)
      expect(formatted[:data].count).to eq(3)

      expect(formatted[:data]).to have_key(:id)
      expect(formatted[:data][:id]).to eq(nil)

      expect(formatted[:data]).to have_key(:type)
      expect(formatted[:data][:type]).to eq("activities")

      expect(formatted[:data]).to have_key(:attributes)
      expect(formatted[:data][:attributes]).to be_a(Hash)

      now = formatted[:data][:attributes]

      expect(now).to have_key(:id)
      expect(now[:id]).to eq(nil)

      expect(now).to have_key(:destination)
      expect(now[:destination]).to eq("Chicago")

      expect(now).to have_key(:activities)
      expect(now[:activities]).to be_an(Array)

      expect(now[:activities].first).to have_key(:title)
      expect(now[:activities].first[:title]).to be_an(String)

      expect(now[:activities].first).to have_key(:type)
      expect(now[:activities].first[:type]).to be_an(String)

      expect(now[:activities].first).to have_key(:participants)
      expect(now[:activities].first[:participants]).to be_an(Integer)

      expect(now[:activities].first).to have_key(:price)
      expect(now[:activities].first[:price]).to be_an(Integer)
    end
  end
end
