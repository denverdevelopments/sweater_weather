require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe 'User Create' do
    describe 'Happy Path' do
      it 'send a user when succesful creation occurs', :vcr do

        post '/api/v1/users', params: {
          "email": "test@test.com",
          "password": "password",
          "password_confirmation": "password" }
        user = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(user[:data][:attributes]).to have_key(:email)
        expect(user[:data][:attributes]).to have_key(:api_key)
        expect(user[:data][:attributes][:email]).to eq("test@test.com")
        expect(User.count).to eq(1)
      end
    end

    describe 'Sad Path' do
      it 'sends an error when params sent are invalid', :vcr do

        post '/api/v1/users', params: {
          "email": "test@test.com",
          "password": "password",
          "password_confirmation": "wrong" }
        user = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(400)
        expect(user).to be_a Hash
        expect(user).to have_key(:errors)
        expect(user[:errors].first).to eq('P')
      end
    end
  end
end
