class TimezonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if %w(manager admin).include? user.role
      scope.joins(:user).where(users: { id: user.id })
    end
  end
end