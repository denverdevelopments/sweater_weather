class ForecastsController < ApplicationController
  def index
    long_lat = ForecastFacade.get_long_lat(params[:location])

    # @located = Forecast.search(params[:query]) if params[:query]
  end
end
