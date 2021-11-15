class Tasks
  attr_reader :id, :activity, :accessibility,
              :type, :participants,
              :price, :key, :link

  def initialize(data)
    @id = nil
    @activity = data[:activity]
    @accessibility = data[:accessibility]
    @type = data[:type]
    @participants = data[:participants]
    @price = data[:price]
    @key = data[:key].to_i
    @link = data[:link]
    # @link = nil if !data[:link]
    # @link = find_link(data)
  end

  # def find_link(data)
  #   return nil if !data[:link]
  #   data[:link]
  # end
end
