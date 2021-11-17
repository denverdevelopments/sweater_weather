class Api::V1::BackgroundsController < ApplicationController
  def index
    if !params[:query].empty? && !params[:query].match(/^(\d)+$/)
      background = UnsplashFacade.get_images(params[:query])
      if background == []
        render json: {errors: "No Image Found"}, status: :not_found
      else
        pics = Images.new(background)
        render json: ImagesSerializer.new(pics)
      end
    else
      render json: {status: :not_found, code: 404, message: "Invalid Input" }, status: :not_found
    end
    # if !params[:location].empty? && params[:location].is_a?(String)
    #   mapped = MapquestFacade.get_long_lat(params[:location])
    #   forecast = WeatherFacade.get_forecast(mapped.lat, mapped.long)
    #   # binding.pry
    #   render json: ForecastSerializer.new(forecast)
    # else
  end
end
