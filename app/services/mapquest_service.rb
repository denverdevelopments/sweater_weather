class MapquestService

  def self.find_coordinates(city_state)
    response = request("/geocoding/v1/address?location=#{city_state}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.request(path)
    conn = Faraday.new(url: 'https://www.mapquestapi.com/') do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
      # faraday.adapter Faraday.default_adapter #?
    end
    conn.get(path)
  end
end
