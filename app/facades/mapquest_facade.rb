class MapquestFacade
  def self.get_long_lat(city_state)
    output = MapquestService.find_coordinates(city_state)
    sorted = output[:results][0][:locations][0]
    Coordinates.new(sorted)
  end

  def self.get_route(start, finish)
    output = MapquestService.find_route(start, finish)
    sorted = output[:route]
    binding.pry
  
    RoadTrip.new(sorted, start, finish)
  end
end
