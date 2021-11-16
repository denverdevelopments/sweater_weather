class Api::V1::ActivitiesController < ApplicationController
  def index
    # if params[:destination]
      headed = params[:destination]
      mapped = MapquestFacade.get_long_lat(headed)
      today = WeatherFacade.get_forecast(mapped.lat, mapped.long)
      total = ActivitiesFacade.get_all(today, headed)
      render json: ActivitiesSerializer.new(total)
    # else
    #   render json: {errors: ["Invalid Input"]}, status: 404
    # end
  end
end
