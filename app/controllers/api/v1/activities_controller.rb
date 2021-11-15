class Api::V1::ActivitiesController < ApplicationController
  def index
    # if params[:destination]
      # acts = ActivityFacade.get_fun(params[:destination])
      mapped = MapquestFacade.get_long_lat(params[:destination])
      forecast = WeatherFacade.get_forecast(mapped.lat, mapped.long)
      # render json: mapped.city
      render json: TodaySerializer.new(forecast)
      # render json: ForecastSerializer.new(forecast)
    # else
    #   render json: {errors: ["Invalid Input"]}, status: 404
    # end
  end
end
