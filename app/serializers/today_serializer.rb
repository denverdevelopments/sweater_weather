class TodaySerializer
  include JSONAPI::Serializer

  attributes :id, :city, :current_weather 
end
