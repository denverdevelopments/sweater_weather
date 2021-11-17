class UnsplashFacade
  def self.get_location(query)
    if query
      output = UnsplashService.find_location(query)
      sorted = output[:results][0][:locations][0] #[:latLng]
      Image.new(sorted)
    else
      render json: {status: :not_found, code: 404, message: "Invalid Input" }, status: :not_found
    end
  end

end
