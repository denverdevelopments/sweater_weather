class Api::V1::ForecastController < ApplicationController
  def index
    long_lat = MapquestFacade.get_long_lat(params[:location])
    # @located = Forecast.search(params[:query]) if params[:query]
  end
end
