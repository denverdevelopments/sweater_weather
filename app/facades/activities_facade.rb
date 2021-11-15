class ActivitiesFacade
  def self.get_all(today)
    type == "recreational" if today[:current][:temp] > 60
    type == "cooking" if today[:current][:temp] < 50
    type == "busywork" if today[:current][:temp]
    act = ActivitiesService.find_by_type(type)
    relax = ActivitiesService.find_by_type(relaxation)
    Activities.new(today,act,relax)
  end

end
