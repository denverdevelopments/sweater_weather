class UnsplashService

  def self.find_location(query)
    response = request("/search/photos?page=1&query=#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.request(path)
    conn = Faraday.new('https://api.unsplash.com/', params: {client_id: ENV['unsplash_access_key'], page: 1})
    conn.get(path)
  end

  # def self.conn
  #   Faraday.new(url: 'https://api.unsplash.com/') do |faraday|
  #     faraday.params['client_id'] = ENV['unsplash_access_key']
  #   end
  # end
end
