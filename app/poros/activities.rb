class Activities
  attr_reader :id, :destination, :forecast, :activities

  def initialize(today, act, relax)
    @id = nil
    @destination = today[:timezone].split('/').last
    @forecast = forecast(today)
    @activities = get_acts(act,relax)
  end

  def forecast(today)
  # def get_forecast(today)
  # def get_forecast(today)
    # total = Hash.new
    # total[:summary] = today[:current][:weather][:description]
    # total[:temperature] = today[:current][:temp].to_s.concat(" F")
    # total["summary"] = today["current"]["weather"]["description"]
    # total["temperature"] = today["current"]["temp"].to_s.concat(" F")
    {
      summary: today[:current][:weather][:description],
      temperature: today[:current][:temp].to_s.concat(" F")
    }
      binding.pry
    # total
  end

  def get_acts(act,relax)
    # acts = []
    first = Hash.new
    first[:title] = act[:activity]
    first[:type] = act[:type]
    first[:participants] = act[:participants]
    first[:price] = act[:price]
    last = Hash.new
    last[:title] = relax[:activity]
    last[:type] = relax[:type]
    last[:participants] = relax[:participants]
    last[:price] = relax[:price]
    [first, last]
  end
end
