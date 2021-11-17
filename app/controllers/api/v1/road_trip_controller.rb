class Api::V1::RoadTripController < ApplicationController
  before_action :set_user

  def create
    if @user.nil? && !params[:to].empty? && !params[:to].match(/^(\d)+$/) && !params[:to].delete('.').match(/^(\d)+$/)
      mapped = MapquestFacade.get_long_lat(params[:to])
      forecast = WeatherFacade.get_forecast(mapped.lat, mapped.long)
      route = MapquestFacade.get_route(params[:from],params[:to])
      trip = RoadTrip.new(params[:from],params[:to],route,forecast)
      render json: RoadTripSerializer.new(trip)
    else
      render json: {status: :not_found, code: 404, message: "Invalid Input" }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find_by(api_key: params[:api_key])
  end
end
