require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe 'session Create' do
    describe 'Happy Path' do
      it 'send a user when a user is found that matches the user provided', :vcr do
        post '/api/v1/users', params: {
          "email": 'whatever@example.com',
          "password": 'password',
          "password_confirmation": 'password'
        }
        post '/api/v1/sessions', params: {
          "email": 'whatever@example.com',
          "password": 'password'
        }
        user = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(user[:data][:attributes]).to have_key(:email)
        expect(user[:data][:attributes]).to have_key(:api_key)
        expect(user[:data][:attributes][:email]).to eq('whatever@example.com')
      end
    end

    describe 'Sad Path' do
      it 'sends an error when params sent are invalid', :vcr do
        post '/api/v1/sessions', params: {
          "email": 'whatever@example.com',
          "password": 'steve'
        }
        user = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(404)
        expect(user).to be_a Hash
        expect(user).to have_key(:errors)
        expect(user[:errors]).to eq('Password or email incorrect')
      end
    end
  end
end
