require 'rails_helper'

RSpec.describe Coordinates do
  it "exists and has attributes" do
    input = {:street=>"",
     :adminArea6=>"",
     :adminArea6Type=>"Neighborhood",
     :adminArea5=>"Denver",
     :adminArea5Type=>"City",
     :adminArea4=>"Denver County",
     :adminArea4Type=>"County",
     :adminArea3=>"CO",
     :adminArea3Type=>"State",
     :adminArea1=>"US",
     :adminArea1Type=>"Country",
     :postalCode=>"",
     :geocodeQualityCode=>"A5XAX",
     :geocodeQuality=>"CITY",
     :dragPoint=>false,
     :sideOfStreet=>"N",
     :linkId=>"282041090",
     :unknownInput=>"",
     :type=>"s",
     :latLng=>{:lat=>39.738453, :lng=>-104.984853},
     :displayLatLng=>{:lat=>39.738453, :lng=>-104.984853},
     :mapUrl=>
      "http://www.mapquestapi.com/staticmap/v5/map?key=eyaDL7GwbdgiqnXF3jwq5v8Axp0NOg8j&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-1&scalebar=true&zoom=12&rand=-1423062374"
    }

    locale = Coordinates.new(input)

    expect(locale).to be_a(Coordinates)
    expect(locale.id).to eq(282041090)
    expect(locale.city).to eq("Denver")
    expect(locale.state).to eq("CO")
    expect(locale.lat).to eq(39.738453)
    expect(locale.long).to eq(-104.984853)
  end
end
