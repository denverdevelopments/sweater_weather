require 'rails_helper'

describe "Upsplash API" do
  context "Happy Path" do
    it "retrieves images for city query", :vcr do
      query = "Denver, CO"
      get "/api/v1/backgrounds?query=#{query}"

      expect(response).to be_successful

      formatted = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(formatted).to be_a(Hash)
      expect(formatted).to have_key :data
      expect(formatted[:data].size).to eq(3)
      expect(formatted[:data]).to be_a(Hash)

      expect(formatted[:data]).to have_key(:id)
      expect(formatted[:data][:id]).to eq(nil)

      expect(formatted[:data]).to have_key(:type)
      expect(formatted[:data][:type]).to eq("images")

      expect(formatted[:data]).to have_key(:attributes)
      expect(formatted[:data][:attributes]).to be_a(Hash)

      expect(formatted[:data][:attributes]).to have_key(:id)
      expect(formatted[:data][:attributes][:id]).to eq(nil)

      expect(formatted[:data][:attributes]).to have_key(:type)
      expect(formatted[:data][:attributes][:type]).to eq("image")

      expect(formatted[:data][:attributes]).to have_key(:top_five)
      expect(formatted[:data][:attributes][:top_five]).to be_an(Array)

      now = formatted[:data][:attributes][:top_five][0]

      expect(now).to have_key(:creator)
      expect(now).to have_key(:unsplash_profile)
      expect(now).to have_key(:location)
      expect(now).to have_key(:pic_url)
      expect(now).to have_key(:source)

      expect(now).not_to have_key(:description)
      expect(now).not_to have_key(:tags)
    end
  end

  context "Sad Path" do
    it "returns error message if query is empty", :vcr do
      query = nil
      get "/api/v1/backgrounds?query=#{query}"

      expect(response).not_to be_successful
      expect(response.status).to eq(404)

      formatted = JSON.parse(response.body, symbolize_names: true)

      expect(formatted).to be_a(Hash)
      expect(formatted[:status]).to eq("not_found")
      expect(formatted[:code]).to eq(404)
      expect(formatted[:message]).to eq("Invalid Input")
    end

    it "returns error message if query is an integer", :vcr do
      query = 12
      get "/api/v1/backgrounds?query=#{query}"

      expect(response).not_to be_successful
      expect(response.status).to eq(404)

      formatted = JSON.parse(response.body, symbolize_names: true)

      expect(formatted).to be_a(Hash)
      expect(formatted[:status]).to eq("not_found")
      expect(formatted[:code]).to eq(404)
      expect(formatted[:message]).to eq("Invalid Input")
    end

    it "returns error message if query is a float", :vcr do
      query = 123.5
      get "/api/v1/backgrounds?query=#{query}"

      expect(response).not_to be_successful
      expect(response.status).to eq(404)

      formatted = JSON.parse(response.body, symbolize_names: true)
      
      expect(formatted).to be_a(Hash)
      expect(formatted).to have_key :errors
      expect(formatted[:errors]).to eq("No Image Found")
    end
  end
end
