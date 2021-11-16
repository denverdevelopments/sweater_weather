class WeatherFacade
  def self.get_forecast(lat,lon)
    WeatherService.find_forecast(lat,lon)
  end
end
