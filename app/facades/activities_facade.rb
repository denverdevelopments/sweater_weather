class BoredFacade

  def self.get_by_type(activity)
    output = BoredService.find_by_type(activity)
    Tasks.new(output)
  end

end
