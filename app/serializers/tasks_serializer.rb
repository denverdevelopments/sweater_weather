class TasksSerializer
  include JSONAPI::Serializer

  attributes :id, :type, :activity, :accessibility, :participants, :price, :link, :key 
end
