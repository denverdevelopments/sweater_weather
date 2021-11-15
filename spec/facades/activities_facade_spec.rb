require 'rails_helper'

RSpec.describe 'ActivitiesFacade' do
  describe 'class methods' do
    describe '::get_all' do
      it 'returns a locations activities summary', :vcr do
        input = {:lat=>39.7385,
                 :lon=>-104.9849,
                 :timezone=>"America/Denver",
                 :timezone_offset=>-25200,
                 :current=>
                  {:dt=>1636995232,
                   :sunrise=>1636983900,
                   :sunset=>1637019867,
                   :temp=>68.05,
                   :feels_like=>65.44,
                   :pressure=>1015,
                   :humidity=>19,
                   :dew_point=>25.18,
                   :uvi=>1.57,
                   :clouds=>6,
                   :visibility=>10000,
                   :wind_speed=>1.01,
                   :wind_deg=>248,
                   :wind_gust=>8.99,
                   :weather=>
                    [{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}
                  }
        fun = ActivitiesFacade.get_all(input)

        expect(fun).to be_a(Activities)

        expect(fun).to have_key(:activities)
        expect(fun[:activities]).to be_an(Array)

        expect(fun).to have_key(:destination)
        expect(fun[:destination]).to be_an(String)

        expect(fun).to have_key(:forecast)
        expect(fun[:forecast]).to be_an(Hash)

      end
    end
  end
end
