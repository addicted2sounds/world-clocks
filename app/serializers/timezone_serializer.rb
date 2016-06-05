class TimezoneSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :difference
  has_one :user
end
