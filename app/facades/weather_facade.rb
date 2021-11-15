class WeatherFacade
  def self.get_forecast(lat,lon)
    WeatherService.find_forecast(lat,lon)
    # output = WeatherService.find_forecast(lat,lon)
    # binding.pry
    # Activities.new(output)
  end

end
