require 'rails_helper'

describe "Mapquest API" do
  it "retrieves coordinates from city-state" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
