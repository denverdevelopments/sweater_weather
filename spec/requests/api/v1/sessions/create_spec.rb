require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe 'session Create' do
    describe 'Happy Path' do
      it 'send a user when a user is found that matches the user provided', :vcr do
        details = {
            "email": "tester@test.com",
            "password": "password",
            "password_confirmation": "password"
        }

        post("/api/v1/users", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: details.to_json)
        expect(response).to be_successful

        formatted = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(formatted[:data][:attributes]).to have_key(:email)
        expect(formatted[:data][:attributes]).to have_key(:api_key)
        expect(formatted[:data][:attributes][:email]).to eq('tester@test.com')
      end
    end

    describe 'Sad Path' do
      it 'sends an error when params sent are invalid', :vcr do
        details = {
            "email": "tester@test.com",
            "password": "password",
            "password_confirmation": "wrong"
        }

        post("/api/v1/users", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: details.to_json)
        expect(response).to_not be_successful

        formatted = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(400)
        expect(formatted).to be_a Hash
        expect(formatted).to have_key(:errors)
        expect(formatted[:errors]).to eq('Password error')
      end
    end
  end
end
