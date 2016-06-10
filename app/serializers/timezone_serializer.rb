class TimezoneSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :difference, :user_id
end
