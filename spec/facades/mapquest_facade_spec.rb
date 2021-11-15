require 'rails_helper'

RSpec.describe 'MapquestFacade' do
  describe 'class methods' do
    describe '::get_long_lat' do
      it 'returns a locations coordinates', :vcr do
        city_state = "Denver, CO"
        response = MapquestFacade.get_long_lat(city_state)

        expect(response).to be_a(Coordinates)
      end
    end
  end
end
