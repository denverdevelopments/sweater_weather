class RoadTripSerializer
  include JSONAPI::Serializer

  attributes :id, :type, :start_city, :end_city, :travel_time, :weather_at_eta
end
