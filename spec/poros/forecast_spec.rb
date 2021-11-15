require 'rails_helper'

RSpec.describe Forecast do
  before :each do
    input = {
      current: {
       :dt=>1623543954,
       :sunrise=>1623497489,
       :sunset=>1623551306,
       :temp=>303.33,
       :feels_like=>301.51,
       :pressure=>1014,
       :humidity=>19,
       :dew_point=>277.18,
       :uvi=>1.62,
       :clouds=>4,
       :visibility=>10000,
       :wind_speed=>2.68,
       :wind_deg=>147,
       :wind_gust=>5.36,
       :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]
     },
      daily: [
        {
          :dt=>1623520800,
          :sunrise=>1623497489,
          :sunset=>1623551306,
          :moonrise=>1623503340,
          :moonset=>1623559500,
          :moon_phase=>0.07,
          :temp=>{:day=>302.51, :min=>289.73, :max=>305.51, :night=>297.32, :eve=>303.33, :morn=>289.73},
          :feels_like=>{:day=>300.79, :night=>288.36, :eve=>301.51, :morn=>288.36},
          :pressure=>1011,
          :humidity=>14,
          :dew_point=>272.89,
          :wind_speed=>5.4,
          :wind_deg=>143,
          :wind_gust=>8.91,
          :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
          :clouds=>0,
          :pop=>0,
          :uvi=>11.42
        }
      ],
      hourly: [
        {
          :dt=>1623542400,
          :temp=>303.33,
          :feels_like=>301.51,
          :pressure=>1014,
          :humidity=>19,
          :dew_point=>277.18,
          :uvi=>1.62,
          :clouds=>4,
          :visibility=>10000,
          :wind_speed=>5.08,
          :wind_deg=>122,
          :wind_gust=>3.27,
          :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
          :pop=>0
        }
      ]
    }

    @upcoming = Forecast.new(input)
  end

  it "exists and has attributes", :vcr do
    expect(@upcoming).to be_an(Forecast)
    expect(@upcoming.id).to eq(nil)
    expect(@upcoming.type).to eq("forecast")
    expect(@upcoming.hourly_weather).to be_a(Array)
    expect(@upcoming.hourly_weather.first).to be_a(Hash)
    expect(@upcoming.daily_weather).to be_a(Array)
    expect(@upcoming.daily_weather.first).to be_a(Hash)
    expect(@upcoming.current_weather).to be_a(Hash)
  end
end
