require 'rails_helper'

RSpec.describe Activities do
  before :each do
    today = {:lat=>29.7608,
             :lon=>-95.3695,
             :timezone=>"America/Chicago",
             :timezone_offset=>-21600,
             :current=>
              {:dt=>1637003045,
               :sunrise=>1636980391,
               :sunset=>1637018759,
               :temp=>80.51,
               :feels_like=>82.69,
               :pressure=>1020,
               :humidity=>62,
               :dew_point=>66.29,
               :uvi=>3.68,
               :clouds=>75,
               :visibility=>10000,
               :wind_speed=>3,
               :wind_deg=>225,
               :wind_gust=>8.99,
               :weather=>
                [{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]}
              }

    act = ActivitiesService.find_by_type("education")
    # activity2 = "relaxation"
    relax = ActivitiesService.find_by_type("relaxation")
    @headed = "Houston, TX"

    @fun = Activities.new(today, act, relax, @headed)
  end

  it "exists and has attributes", :vcr do
    expect(@fun).to be_an(Activities)
      # binding.pry
    expect(@fun.id).to eq(nil)
    expect(@fun.forecast).to be_a(Hash)

    expect(@fun.destination).to be_a(String)
    expect(@fun.destination).to eq(@headed)

    expect(@fun.activities).to be_a(Array)
    expect(@fun.activities[0]).to be_a(Hash)
    expect(@fun.activities[0]).to have_key :title
    expect(@fun.activities[0][:title]).to be_a(String)
    expect(@fun.activities[0]).to have_key :type
    expect(@fun.activities[0][:type]).to be_a(String)
    expect(@fun.activities[0]).to have_key :participants
    expect(@fun.activities[0][:participants]).to be_a(Integer)
    expect(@fun.activities[0]).to have_key :price
    expect(@fun.activities[0][:price]).not_to be_a(String)
  end
end
