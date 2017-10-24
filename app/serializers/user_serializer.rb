class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at, :points, :first_name, :last_name, :avatar_url
end
