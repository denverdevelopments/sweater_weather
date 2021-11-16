class ActivitiesFacade
  def self.get_all(today, headed)
    if today[:current][:temp] > 60
      activity = "recreational"
    elsif today[:current][:temp] < 50
      activity = "cooking"
    else
      activity = "busywork"
    end
    act = ActivitiesService.find_by_type(activity)
    relax = ActivitiesService.find_by_type("relaxation")
    Activities.new(today, act, relax, headed)
  end

end
