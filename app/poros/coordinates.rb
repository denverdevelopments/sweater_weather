class Coordinates
  attr_reader :id, :lat, :long, :city, :state

  def initialize(data)
    @id = data[:linkId].to_i
    @lat = data[:latLng][:lat]
    @long = data[:latLng][:lng]
    @city = data[:adminArea5]
    @state = data[:adminArea3]
  end
end
