class MapquestFacade
  def self.get_long_lat(city_state)
    if city_state
      output = MapquestService.find_coordinates(city_state)
      sorted = output[:results][0][:locations][0] #[:latLng]
      Coordinates.new(sorted)
    else
      render json: {status: :not_found, code: 404, message: "Invalid Input" }, status: :not_found
    end
  end

end
