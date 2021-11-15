class MapquestFacade
  # def self.movie_show(id)
  #   info = MovieService.request("/3/movie/#{id}")
  #   @movie = Movie.new(info)
  # end

  # def self.get_recommended(id)
  #   MovieService.recommendations(id)
    # def self.search_title(query)
  #   query.gsub!(' ', '+')
  # end

  def self.get_long_lat(city_state)
    MapquestService.find_coordinates(city_state)
  end

end
