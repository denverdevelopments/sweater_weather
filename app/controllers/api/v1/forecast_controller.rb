class Api::V1::ForecastController < ApplicationController
  def index
    mapped = MapquestFacade.get_long_lat(params[:location])
    forecast = WeatherFacade.get_forecast(mapped.lat, mapped.long)
    # binding.pry
    render json: CoordinatesSerializer.new(map)
    # render json: CoordinatesSerializer.new(long_lat)
  end
end
