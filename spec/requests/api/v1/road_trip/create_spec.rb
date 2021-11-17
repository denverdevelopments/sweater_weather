require 'rails_helper'

describe "RoadTrip Create" do
  # context "Happy Path" do
    it "retrieves route from two locations", :vcr do
      start = "Houston, TX"
      finish = "Denver, CO"
      get "/directions/v2/route&from=#{start}&to=#{finish}"

      expect(response).to be_successful

      formatted = JSON.parse(response.body, symbolize_names: true)
        binding.pry 
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
    end
  # end
  #
  # context "Sad Path" do
  #   it "returns error message if location is empty", :vcr do
  #     city_state = nil
  #     get "/api/v1/forecast?location=#{city_state}"
  #
  #     expect(response).not_to be_successful
  #     expect(response.status).to eq(404)
  #
  #     formatted = JSON.parse(response.body, symbolize_names: true)
  #     # binding.pry
  #     expect(formatted).to be_a(Hash)
  #     expect(formatted[:status]).to eq("not_found")
  #     expect(formatted[:code]).to eq(404)
  #     expect(formatted[:message]).to eq("Invalid Input")
  #   end
  #
  #   it "returns error message if location is an integer", :vcr do
  #     city_state = 12
  #     get "/api/v1/forecast?location=#{city_state}"
  #
  #     expect(response).not_to be_successful
  #     expect(response.status).to eq(404)
  #
  #     formatted = JSON.parse(response.body, symbolize_names: true)
  #
  #     expect(formatted).to be_a(Hash)
  #     expect(formatted[:status]).to eq("not_found")
  #     expect(formatted[:code]).to eq(404)
  #     expect(formatted[:message]).to eq("Invalid Input")
  #   end
  #
  #   it "returns error message if location is a float", :vcr do
  #     city_state = 34.5
  #     get "/api/v1/forecast?location=#{city_state}"
  #
  #     expect(response).not_to be_successful
  #     expect(response.status).to eq(404)
  #
  #     formatted = JSON.parse(response.body, symbolize_names: true)
  #
  #     expect(formatted).to be_a(Hash)
  #     expect(formatted[:status]).to eq("not_found")
  #     expect(formatted[:code]).to eq(404)
  #     expect(formatted[:message]).to eq("Invalid Input")
  #   end
  # end
end
