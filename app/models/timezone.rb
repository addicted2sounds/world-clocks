class Timezone < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :city, presence: true
  validates :difference, numericality: {
      greater_than_or_equal_to: -12,
      less_than_or_equal_to: 12,
      only_integer: true
  }
end
