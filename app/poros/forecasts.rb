class Forecasts
  attr_reader :id, :lat, :long, :city, :state

  def initialize(data)
    @id = nil
    @type = "forecast"
    @current_weather = set_forecast(data[:current])
  end

  def set_forecast(input)
    current = Hash.new
    current["datetime"] = Time.at(input[:dt])
    current["sunrise"] = Time.at(input[:sunrise])
    current["sunset"] = Time.at(input[:sunset])
    current["temperature"] = (input[:sunset]) #-32)*5/9
    current
  end
end
