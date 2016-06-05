class TimezonePolicy < ApplicationPolicy
  def create?
    true
  end

  def permitted_attributes
    attrs = [:name, :city, :difference]
    attrs.push :user_id if %w(manager admin).include? user.role
    attrs
  end

  class Scope < Scope
    def resolve
      return scope.all if %w(manager admin).include? user.role
      scope.joins(:user).where(users: { id: user.id })
    end
  end
end