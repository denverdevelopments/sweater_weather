class Forecast
  attr_reader :id, :type, :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @id = nil
    @type = "forecast"
    @current_weather = get_current(data[:current])
    @daily_weather = get_daily(data[:daily])
    @hourly_weather = get_hourly(data[:hourly])
  end

  def get_current(input)
    # current = Hash.new
    {
      datetime: Time.at(input[:dt]),
      sunrise: Time.at(input[:sunrise]),
      sunset: Time.at(input[:sunset]),
      temperature: input[:temp],
      feels_like: input[:feels_like],
      humidity: input[:humidity],
      uvi: input[:uvi],
      visibility: input[:visibility],
      conditions: input[:weather][0][:description],
      icon: input[:weather][0][:icon]
    }
    # current
  end

  def get_daily(input)
    input.map do |day|
      {
        time: Time.at(day[:dt]),
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:max],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end.first(5)
  end

  def get_hourly(input)
    input.map do |hour|
      {
        time: Time.at(hour[:dt]).strftime("%R"),
        temperature: hour[:temp],
        conditions: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end.first(8)
    # binding.pry
  end
end
