class ImagesSerializer
  include JSONAPI::Serializer

  attributes :id, :type, :top_five
end
