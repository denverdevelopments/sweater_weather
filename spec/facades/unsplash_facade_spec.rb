require 'rails_helper'

RSpec.describe 'UnsplashFacade' do
  describe 'class methods' do
    describe '::get_images' do
      it 'returns a locations photos', :vcr do
        query = "Denver,CO"
        response = UnsplashFacade.get_images(query)

        expect(response).to be_a(Array)
        expect(response.first).to be_a(Hash)
        expect(response.first).to have_key :user
        expect(response.first).to have_key :urls
      end
    end
  end
end
