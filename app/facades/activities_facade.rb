class ActivitiesFacade
  def self.get_all(today)
    # type == "recreational" if today[:current][:temp] > 60
    # type == "cooking" if today[:current][:temp] < 50
    # type == "busywork" if today[:current][:temp]
    # act = ActivitiesService.find_by_type(type)
    # binding.pry
    # if today[:current][:temp] > 60
    #   act = ActivitiesService.find_by_type(recreational)
    # elsif today[:current][:temp] < 50
    #   act = ActivitiesService.find_by_type(cooking)
    # else
    #   act = ActivitiesService.find_by_type(busywork)
    # end
    if today[:current][:temp] > 60
      activity = "recreational"
    elsif today[:current][:temp] < 50
      activity = "cooking"
    else
      activity = "busywork"
    end
    act = ActivitiesService.find_by_type(activity)

    activity2 = "relaxation"
    relax = ActivitiesService.find_by_type(activity2)
    xy = Activities.new(today, act, relax)
    binding.pry
  end

end
