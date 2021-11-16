class Activities
  attr_reader :id, :destination, :forecast, :activities

  def initialize(today, act, relax, headed)
    @id = nil
    @destination = headed
    @forecast = get_forecast(today)
    @activities = get_acts(act,relax)
  end

  def get_forecast(today)
    {
      summary: today[:current][:weather][0][:description],
      temperature: today[:current][:temp].to_s.concat(" F")
    }
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
