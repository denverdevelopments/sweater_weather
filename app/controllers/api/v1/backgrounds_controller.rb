class Api::V1::BackgroundsController < ApplicationController
  def index
    if !params[:location].empty? && params[:location].is_a?(String)
      mapped = MapquestFacade.get_long_lat(params[:location])
      forecast = WeatherFacade.get_forecast(mapped.lat, mapped.long)
      # binding.pry
      render json: ForecastSerializer.new(forecast)
    else
      render json: {status: :not_found, code: 404, message: "Invalid Input" }, status: :not_found
    end
  end
end
