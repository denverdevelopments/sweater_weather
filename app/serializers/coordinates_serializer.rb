class CoordinatesSerializer
  include JSONAPI::Serializer

  attributes :id, :lat, :long, :city, :state
end
