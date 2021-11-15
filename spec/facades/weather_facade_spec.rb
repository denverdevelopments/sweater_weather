require 'rails_helper'

RSpec.describe 'WeatherFacade' do
  describe 'class methods' do
    describe '::get_forecast' do
      it 'returns a locations forecasts', :vcr do
        lat = 39.738453; long = -104.984853
        response = WeatherFacade.get_forecast(lat,long)

        expect(response).to be_a(Today)

        expect(response.current_weather).to be_a(Hash)
      end
    end
  end
end
