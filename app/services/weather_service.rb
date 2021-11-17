class WeatherService
  def self.find_forecast(latitude, longitude)
    response = request("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.request(path)
    conn =  Faraday.new("https://api.openweathermap.org", params: {
          appid: ENV['openweather_key'],
          exclude: 'minutely,alerts',
          units: 'imperial' }
        )
    conn.get(path)
  end
end
