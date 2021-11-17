class Images
  attr_reader :id, :type, :top_five

  def initialize(data)
    @id = nil
    @type = "image"
    @top_five = get_details(data)
  end

  def get_details(input)
    input.map do |pair|
      {
        creator: pair[:user][:username],
        unsplash_profile: pair[:user][:links][:portfolio],
        location: pair[:user][:location],
        pic_url: pair[:urls][:full],
        source: "Upsplash.com"
      }
    end.first(5)
  end
end
