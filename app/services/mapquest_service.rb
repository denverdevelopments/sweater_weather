class MapquestService
  # def self.reviews(id)
  #   request("/3/movie/#{id}/reviews")[:results]
  # end
  #
  # def self.top_forty(page)
  #   request("/3/discover/movie?page=#{page}")[:results]
  # end
  #
  # def self.search_title(query)
  #   request("/3/search/movie?query=#{query}")[:results]
  # end

  def self.find_coordinates(city_state)
    request("/geocoding/v1/address?key=KEY&location=#{city_state}")[:results]
  end

  private

  def self.request(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://www.mapquestapi.com/') do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
      # faraday.adapter Faraday.default_adapter #?
    end
  end
end
