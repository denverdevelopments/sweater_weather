class Api::V1::RoadTripController < ApplicationController
  def create
    if !params[:location].empty? && !params[:location].match(/^(\d)+$/) && !params[:location].delete('.').match(/^(\d)+$/)
      mapped = MapquestFacade.get_long_lat(params[:location])
      forecast = WeatherFacade.get_forecast(mapped.lat, mapped.long)
      render json: ForecastSerializer.new(forecast)
    else
      render json: {status: :not_found, code: 404, message: "Invalid Input" }, status: :not_found
    end
  end
end
