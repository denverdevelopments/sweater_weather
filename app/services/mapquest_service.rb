class MapquestService

  def self.find_coordinates(city_state)
    request("/geocoding/v1/address?location=#{city_state}")
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
