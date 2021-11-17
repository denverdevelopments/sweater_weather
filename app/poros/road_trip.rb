class RoadTrip
  attr_reader :id, :type, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(start,finish,route,forecast)
    @id = nil
    @type = "roadtrip"
    @start_city = start
    @end_city = finish
    @travel_time = get_time(route)
    @weather_at_eta = get_conditions(forecast)
  end

  def get_conditions(forecast)
    {
      temperature: forecast[:current][:temp],
      conditions: forecast[:current][0][:description]
    }

    # {
    #   datetime: Time.at(input[:dt]),
    #   sunrise: Time.at(input[:sunrise]),
    #   sunset: Time.at(input[:sunset]),
    #   temperature: input[:temp],
    #   feels_like: input[:feels_like],
    #   humidity: input[:humidity],
    #   uvi: input[:uvi],
    #   visibility: input[:visibility],
    #   conditions: input[:weather][0][:description],
    #   icon: input[:weather][0][:icon]
    # }
  end

  def get_time(route)
    total_seconds = route[:route][:realTime]
    hr = total_seconds / (60 * 60)
    min = ((total_seconds - (hrs*3600)) % 60).to_i
    "#{hr} hours, #{min} minutes"
  end
end
