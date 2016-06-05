require 'email_validator'

class User < ApplicationRecord
  has_secure_password
  enum role: [:user, :manager, :admin]
  has_many :timezones
  validates :email, email: true, uniqueness: true

  def self.from_token_payload(payload)
    self.find_by email: payload['email']
  end

  def can_manage_alias_timezones?
    manager? or admin?
  end

  def can_manage_users?
    admin?
  end
end
