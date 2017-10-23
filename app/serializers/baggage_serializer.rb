class BaggageSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo_url, :rental_enabled
end
