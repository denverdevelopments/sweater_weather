class ActivitiesSerializer
  include JSONAPI::Serializer

  attributes :id, :city, :current_weather
end
