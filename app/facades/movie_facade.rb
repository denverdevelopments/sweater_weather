class MovieFacade
  def self.movie_show(id)
    info = MovieService.request("/3/movie/#{id}")
    @movie = Movie.new(info)
  end

  def self.all_cast(id)
    cast = MovieService.request("/3/movie/#{id}/credits")[:cast]
    cast[0..9].map { |actor| Actor.new(actor) }
  end

  def self.all_reviews(id)
    revs = MovieService.reviews(id)
    revs.map { |review| Review.new(review) }
  end

  def self.top_forty
    MovieService.top_forty(1) + MovieService.top_forty(2)
  end

  def self.search_title(query)
    query.gsub!(' ', '+')
    MovieService.search_title(query)
  end

  def self.now_playing
    MovieService.now_playing
  end

  def self.get_recommended(id)
    MovieService.recommendations(id)
  end
end
