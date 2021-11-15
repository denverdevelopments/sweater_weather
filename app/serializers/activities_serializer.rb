class ActivitiesSerializer
  include JSONAPI::Serializer

  attributes :id, :destination, :forecast, :activities
end
