require 'rails_helper'

RSpec.describe UnsplashService do
  it "can get location photos", :vcr do
    query = "Denver,CO"
      response = UnsplashService.find_images(query)

    expect(response).to be_a Hash
    expect(response).to have_key :results
    expect(response[:results]).to be_a(Array)
    expect(response[:results].first).to be_a(Hash)

      result = response[:results].first
    expect(result).to have_key :urls
    expect(result[:urls]).to be_a(Hash)
    expect(result[:urls]).to have_key :full
    expect(result[:urls][:full]).to be_a(String)

    expect(result).to have_key :user
    expect(result[:user]).to be_a(Hash)

    expect(result[:user]).to have_key :location
    expect(result[:user][:location]).to be_a(String)
    expect(result[:user]).to have_key :username
    expect(result[:user][:username]).to be_a(String)
    expect(result[:user]).to have_key :links
    expect(result[:user][:links]).to be_a(Hash)
    expect(result[:user][:links]).to have_key :html
    expect(result[:user][:links][:html]).to be_a(String)
  end
end
