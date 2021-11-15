class Today
  attr_reader :id, :current_weather, :city

  def initialize(data)
    @id = nil
    @city = data[:timezone].split('/').last
    @current_weather = get_current(data[:current])
  end

  def get_current(input)
    current = Hash.new
    current["datetime"] = Time.at(input[:dt])
    current["sunrise"] = Time.at(input[:sunrise])
    current["sunset"] = Time.at(input[:sunset])
    current["temperature"] = input[:temp]
    current["feels_like"] = input[:feels_like]
    current["humidity"] = input[:humidity]
    current["uvi"] = input[:uvi]
    current["visibility"] = input[:visibility]
    current["conditions"] = input[:weather][0][:description]
    current["icon"] = input[:weather][0][:icon]
    current
  end
end
