class MovieService
  def self.reviews(id)
    request("/3/movie/#{id}/reviews")[:results]
  end

  def self.search_title(query)
    request("/3/search/movie?query=#{query}")[:results]
  end

  def self.top_forty(page)
    request("/3/discover/movie?page=#{page}")[:results]
  end

  def self.now_playing
    request('/3/movie/now_playing')[:results]
  end

  def self.recommendations(id)
    request("/3/movie/#{id}/recommendations")[:results]
  end

  private

  def self.request(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/') do |faraday|
      faraday.params['api_key'] = ENV['tmdb_api_key']
      # faraday.adapter Faraday.default_adapter #?
    end
  end
end
