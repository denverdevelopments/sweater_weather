class Api::V1::ActivitiesController < ApplicationController
  def index
    # if params[:destination]
      # acts = ActivityFacade.get_fun(params[:destination])
      mapped = MapquestFacade.get_long_lat(params[:destination])
      today = WeatherFacade.get_forecast(mapped.lat, mapped.long)
      total = ActivitiesFacade.get_all(today,params[:destination])

      render json: ActivitiesSerializer.new(total)
      # render json: ForecastSerializer.new(forecast)
    # else
    #   render json: {errors: ["Invalid Input"]}, status: 404
    # end
  end
end
