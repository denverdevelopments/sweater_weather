class WeatherFacade

  def self.get_forecast(lat,lon)
    output = WeatherService.find_forecast(lat,lon)
    Forecast.new(output)
  end

end
