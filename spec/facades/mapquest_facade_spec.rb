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

    describe '::get_route' do
      it 'returns a route hash', :vcr do
        start = "Houston,TX"
        finish = "Denver,CO"
        response = MapquestFacade.get_route(start, finish)
          binding.pry
        expect(response).to be_a(Hash)
      end
    end
  end
end
