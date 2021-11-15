class ForecastsSerializer
  include JSONAPI::Serializer

  attributes :id, :type, :current_weather, :daily_weather, :hourly_weather
end
