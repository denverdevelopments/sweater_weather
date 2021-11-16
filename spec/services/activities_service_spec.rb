require 'rails_helper'

RSpec.describe ActivitiesService do
  it "can get activity details", :vcr do
    type = "recreational"
    response = ActivitiesService.find_by_type(type)

    expect(response).to be_a Hash

    expect(response).to have_key :activity
    expect(response[:activity]).to be_a(String)

    expect(response).to have_key :accessibility
    expect(response[:accessibility]).to be_a(Float)

    expect(response).to have_key :type
    expect(response[:type]).to be_a(String)
    expect(response[:type]).to eq(type)

    expect(response).to have_key :participants
    expect(response[:participants]).to be_a(Integer)

    expect(response).to have_key :price
    expect(response[:price]).to be_a(Float)

    expect(response).to have_key :key
    expect(response[:key]).to be_a(String)
  end
end
