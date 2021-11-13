require 'rails_helper'

RSpec.describe MovieService do

  it "can get all movie details", :vcr do
    # response = MovieService.details(580489)
    response = MovieService.request("/3/movie/580489")

    expect(response).to be_a Hash

    expect(response).to have_key :title
    expect(response[:title]).to be_a String

    expect(response).to have_key :id
    expect(response[:id]).to be_a Integer

    expect(response).to have_key :vote_average
    expect(response[:vote_average]).to be_a Float

    expect(response).to have_key :runtime
    expect(response[:runtime]).to be_an Integer

    expect(response).to have_key :genres
    expect(response[:genres]).to be_an Array

    expect(response).to have_key :overview
    expect(response[:overview]).to be_an String
  end

  it "can get recommended movie", :vcr do
    response = MovieService.recommendtions(580489)

    expect(response).to be_an Array

    first_result = response.second

    expect(first_result).to have_key :title
    expect(first_result[:title]).to be_a String

    expect(first_result).to have_key :id
    expect(first_result[:id]).to be_a Integer
  end

  it "can get movie cast", :vcr do
    # response = MovieService.cast(580489)
    response = MovieService.request("/3/movie/580489/credits")

    expect(response).to be_a Hash
    expect(response).to have_key :cast
    expect(response[:cast]).to be_an Array

    cast_member = response[:cast].first

    expect(cast_member).to be_a Hash

    expect(cast_member).to have_key :name
    expect(cast_member[:name]).to be_an String

    expect(cast_member).to have_key :character
    expect(cast_member[:character]).to be_an String
  end

  it "can get movie reviews", :vcr do
    response = MovieService.request("/3/movie/580489/reviews")

    expect(response).to be_a Hash
    expect(response).to have_key :results
    expect(response[:results]).to be_an Array

    first_review = response[:results].first

    expect(first_review).to have_key :author
    expect(first_review[:author]).to be_an String

    expect(first_review).to have_key :content
    expect(first_review[:content]).to be_an String
  end

  it "can search for titles", :vcr do
    response = MovieService.search_title("venom")

    expect(response).to be_an Array

    first_result = response.first

    expect(first_result).to have_key :title
    expect(first_result[:title]).to be_a String

    expect(first_result).to have_key :id
    expect(first_result[:id]).to be_a Integer

    expect(first_result).to have_key :vote_average
    expect(first_result[:vote_average]).to be_a Float
  end

  it "can search for top forty titles", :vcr do
    response = MovieService.top_forty(1)

    expect(response).to be_an Array

    first_result = response.second

    expect(first_result).to have_key :title
    expect(first_result[:title]).to be_a String

    expect(first_result).to have_key :id
    expect(first_result[:id]).to be_a Integer

    expect(first_result).to have_key :vote_average
    expect(first_result[:vote_average]).to be_a Float
  end

  it "can list now playing titles", :vcr do
    response = MovieService.now_playing

    expect(response).to be_an Array

    first_result = response.second

    expect(first_result).to have_key :title
    expect(first_result[:title]).to be_a String

    expect(first_result).to have_key :id
    expect(first_result[:id]).to be_a Integer

    expect(first_result).to have_key :vote_average
    expect(first_result[:vote_average]).to be_a Float
  end
end
