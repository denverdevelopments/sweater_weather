require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe 'session login' do
    before :each do
      input = {
          "email": "tester@test.com",
          "password": "password",
          "password_confirmation": "password"
      }
      post("/api/v1/users", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: input.to_json)
    end

    describe 'Happy Path' do
      it 'logs in a previous user', :vcr do
        details = {
          "email": "tester@test.com",
          "password": "password"
        }

        post("/api/v1/sessions", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: details.to_json)
        expect(response).to be_successful

        formatted = JSON.parse(response.body, symbolize_names: true)
        new_user = User.last

        expect(formatted).to be_a(Hash)
        expect(formatted[:data]).to be_a(Hash)
        expect(formatted[:data][:id].to_i).to eq(new_user.id)
        expect(formatted[:data][:type]).to eq("user")
        expect(formatted[:data][:attributes][:email]).to eq("tester@test.com")
        expect(formatted[:data][:attributes][:api_key]).to eq(new_user.api_key)
      end
    end

    describe 'Sad Path' do
      it 'sends an error when params sent are invalid', :vcr do
        details = {
            "email": "tester@test.com",
            "password": "wrong"
        }
        post("/api/v1/sessions", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: details.to_json)
        expect(response).to_not be_successful

        formatted = JSON.parse(response.body, symbolize_names: true)
        expect(formatted).to have_key(:errors)
        expect(formatted[:errors]).to eq('Password or email incorrect')
      end

      it 'sends an error when field is empty', :vcr do
        details = {
            "password": "password"
        }
        post("/api/v1/sessions", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: details.to_json)
        expect(response).to_not be_successful

        formatted = JSON.parse(response.body, symbolize_names: true)
        expect(formatted).to have_key(:errors)
        expect(formatted[:errors]).to eq('Password or email incorrect')
      end
    end
  end
end
