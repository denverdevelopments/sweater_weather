class Activities
  attr_reader :id, :current_weather, :city

  def initialize(today,act,relax)
    @id = nil
    @destination = today[:timezone].split('/').last
    @forecast = get_forecast(today) today[:current][:weather][:description]
    @activities.get_acts(act,relax)
  end

  def get_forecast(today)
    total = Hash.new
    total[:summary] = today[:current][:weather][:description]
    total[:temperature] = today[:current][:temp].to_s.concat(" F")
    total
  end

  def get_acts(act,relax)
    acts = []
    first = Hash.new
    first[:title]
    last = Hash.new
    acts[:summary] = today[:current][:weather][:description]
    acts[:temperature] = today[:current][:temp].to_s.concat(" F")
    acts
  end
end
