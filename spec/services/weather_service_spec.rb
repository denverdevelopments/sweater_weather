require 'rails_helper'

RSpec.describe WeatherService do
  it "can get coordinates weather forecasts", :vcr do
    lat = 39.738453; long = -104.984853
    response = WeatherService.find_forecast(lat,long)

    expect(response).to be_a Hash

    expect(response).to have_key :current
    expect(response[:current]).to be_a(Hash)

    expect(response).to have_key :hourly
    expect(response[:hourly]).to be_a(Array)

    expect(response).to have_key :daily
    expect(response[:daily]).to be_a(Array)
  end

  it "can get a locations current forecast", :vcr do
    lat = 39.738453; long = -104.984853
    now = WeatherService.find_forecast(lat,long)[:current]

    expect(now).to be_a Hash

    expect(now).to have_key :dt
    expect(now[:dt]).to be_a(Integer)

    expect(now).to have_key :sunrise
    expect(now[:sunrise]).to be_a(Integer)

    expect(now).to have_key :sunset
    expect(now[:sunset]).to be_a(Integer)

    expect(now).to have_key :temp
    expect(now[:temp]).to be_a(Float)

    expect(now).to have_key :feels_like
    expect(now[:feels_like]).to be_a(Float)

    expect(now).to have_key :pressure
    expect(now[:pressure]).to be_a(Integer)

    expect(now).to have_key :humidity
    expect(now[:humidity]).to be_a(Integer)

    expect(now).to have_key :dew_point
    expect(now[:dew_point]).to be_a(Float)

    expect(now).to have_key :uvi
    expect(now[:uvi]).to be_a(Integer)

    expect(now).to have_key :clouds
    expect(now[:clouds]).to be_a(Integer)

    expect(now).to have_key :visibility
    expect(now[:visibility]).to be_a(Integer)

    expect(now).to have_key :wind_speed
    expect(now[:wind_speed]).to be_a(Float)

    expect(now).to have_key :wind_deg
    expect(now[:wind_deg]).to be_a(Integer)

    expect(now).to have_key :wind_gust
    expect(now[:wind_gust]).to be_a(Float || Integer)

    expect(now).to have_key :weather
    expect(now[:weather]).to be_a(Array)

    expect(now[:weather]).to be_a(Array)
    expect(now[:weather][0]).to have_key :id
    expect(now[:weather][0][:id]).to be_a(Integer)

    expect(now[:weather][0]).to have_key :main
    expect(now[:weather][0][:main]).to be_a(String)

    expect(now[:weather][0]).to have_key :description
    expect(now[:weather][0][:description]).to be_a(String)

    expect(now[:weather][0]).to have_key :icon
    expect(now[:weather][0][:icon]).to be_a(String)
  end

  it "can get a locations hourly forecast", :vcr do
    lat = 39.738453; long = -104.984853
    hours = WeatherService.find_forecast(lat,long)[:hourly]

    expect(hours).to be_a(Array)
    expect(hours.first).to be_a(Hash)

    expect(hours.first).to have_key :dt
    expect(hours.first[:dt]).to be_a(Integer)

    expect(hours.first).to have_key :temp
    expect(hours.first[:temp]).to be_a(Float)

    expect(hours.first).to have_key :weather
    expect(hours.first[:weather]).to be_a(Array)

    expect(hours.first[:weather]).to be_a(Array)
    expect(hours.first[:weather][0]).to have_key :description
    expect(hours.first[:weather][0][:description]).to be_a(String)

    expect(hours.first[:weather][0]).to have_key :icon
    expect(hours.first[:weather][0][:icon]).to be_a(String)
  end
end
