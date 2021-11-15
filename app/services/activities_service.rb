class ActivitiesService

  def self.find_by_type(activity)
    request("/api/activity?type=#{activity}")
  end

  private

  def self.request(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('http://www.boredapi.com/')
  end
end
