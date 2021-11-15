require 'rails_helper'

RSpec.describe 'WeatherFacade' do
  describe 'class methods' do
    describe '::get_forecast' do
      it 'returns a locations forecasts', :vcr do
        lat = 39.738453; long = -104.984853
        response = WeatherFacade.get_forecast(lat,long)

        expect(response).to be_a(Forecast)

        expect(response.current_weather).to be_a(Hash)
        expect(response.daily_weather).to be_a(Array)
        expect(response.hourly_weather).to be_a(Array)
      end
    end
  end
end
