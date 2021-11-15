class MapquestFacade
  def self.get_long_lat(city_state)
    output = MapquestService.find_coordinates(city_state)
    sorted = output[:results][0][:locations][0] #[:latLng]
    Coordinates.new(sorted)
  end

end
