class Api::V1::RoadTripController < ApplicationController
  def create
    # if !params[:location].empty?

    # start = MapquestFacade.get_long_lat(params[:from])
    # finish = MapquestFacade.get_long_lat(params[:to])
    route = MapquestFacade.get_route(params[:from],params[:to])
    # render json: RoadTripSerializer.new(forecast)

    # else
    #   render json: {status: :not_found, code: 404, message: "Invalid Input" }, status: :not_found
    # end
  end
end
