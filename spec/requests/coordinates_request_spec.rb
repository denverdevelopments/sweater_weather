require 'rails_helper'

describe "Mapquest API" do
  it "retrieves coordinates from city-state" do
    city_state = "denver,co"
    get "/api/v1/forecast?location=#{city_state}"
    # get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    binding.pry
  end
end
