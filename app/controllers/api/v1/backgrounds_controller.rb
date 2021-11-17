class Api::V1::BackgroundsController < ApplicationController
  def index
    background = UnsplashFacade.get_location(params[:query])
    if background[:results] == []
      render json: {errors: "No Image Found"}, status: :not_found
    else
      poro = Background.new(background)
      render json: ImageSerializer.new(poro)
    end
            
    # if !params[:location].empty? && params[:location].is_a?(String)
    #   mapped = MapquestFacade.get_long_lat(params[:location])
    #   forecast = WeatherFacade.get_forecast(mapped.lat, mapped.long)
    #   # binding.pry
    #   render json: ForecastSerializer.new(forecast)
    # else
    #   render json: {status: :not_found, code: 404, message: "Invalid Input" }, status: :not_found
    # end
  end
end
