class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location]
      mapped = MapquestFacade.get_long_lat(params[:location])
      forecast = WeatherFacade.get_forecast(mapped.lat, mapped.long)
      binding.pry
      render json: ForecastSerializer.new(forecast)
    else
      # render json: {status: :not_found, code: 404, message: "Invalid Input" }, status: :not_found
      render json: {errors: ["Invalid Input"]}, status: 404
    end
  end
end
