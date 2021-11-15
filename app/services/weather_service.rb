class WeatherService

  def self.find_forecast(latitude, longitude)
    request("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}")
  end

  private

  def self.request(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/') do |faraday|
      faraday.params['appid'] = ENV['openweather_key']
      # faraday.adapter Faraday.default_adapter #?
    end
  end
end
