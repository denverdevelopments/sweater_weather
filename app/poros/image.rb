class Image
  attr_reader :id, :type, :attributes

  def initialize(data)
    @id = nil
    @type = "image"
    @attributes = get_details(data)
  end

  def get_details(input)
    input.map do |pair|
      {
        "location" => pair[:user][:location]),
        "pic_url" => pair[:urls][:full],
        "source" => "Upsplash.com",
        "creator" => pair[:user][:username],
        "unsplash_profile" => pair[:user][:links][:portfolio]
      }
    end.first(5)
  end
end
