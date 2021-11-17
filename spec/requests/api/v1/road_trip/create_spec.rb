require 'rails_helper'

describe "RoadTrip Create" do
  it "retrieves route from two locations", :vcr do
    start = "Houston,TX"
    finish = "Denver,CO"
    # post "http://www.mapquestapi.com/directions/v2/route&from=#{start}&to=#{finish}"

    details = {
        "email": "tester@test.com",
        "password": "password",
        "password_confirmation": "password"
    }
    post("/api/v1/users", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: details.to_json)
    @new_key = User.last.api_key

    ##
    input = {
        "email": "tester@test.com",
        "password": "password",
        "password_confirmation": "password"
    }
    post("/api/v1/users", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: input.to_json)

      info = {
        "email": "tester@test.com",
        "password": "password"
      }

      post("/api/v1/sessions", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: info.to_json)
      ##

    places = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": @new_key
      }

    post("/api/v1/road_trip", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: places.to_json)
      binding.pry

    formatted = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(formatted).to be_a(Hash)
    expect(formatted).to have_key(:data)
    expect(formatted[:data]).to be_a(Hash)

    expect(formatted[:data]).to have_key(:id)
    expect(formatted[:data][:id]).to eq(nil)

    expect(formatted[:data]).to have_key(:type)
    expect(formatted[:data][:type]).to eq("roadtrip")

    expect(formatted[:data]).to have_key(:attributes)
    expect(formatted[:data][:attributes]).to be_a(Hash)

    now = formatted[:data][:attributes]
    expect(now).to have_key(:start_city)
    expect(now[:start_city]).to be_an(String)

    expect(now).to have_key(:end_city)
    expect(now[:end_city]).to be_an(String)

    expect(now).to have_key(:travel_time)
    expect(now[:travel_time]).to be_an(String)

    expect(now).to have_key(:weather_at_eta)
    expect(now[:weather_at_eta]).to be_an(Hash)

    expect(now[:weather_at_eta]).to have_key(:temperature)
    expect(now[:weather_at_eta][:temperature]).to be_an(Float)

    expect(now[:weather_at_eta]).to have_key(:conditions)
    expect(now[:weather_at_eta][:conditions]).to be_an(String)
  end
end
