class WeatherFacade

  def self.get_forecast(lat,lon)
    output = WeatherService.find_forecast(lat,lon)
    # binding.pry
    Forecast.new(output)
  end

end
