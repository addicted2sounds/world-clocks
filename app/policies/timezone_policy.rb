class TimezonePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.joins(:user).where(users: { id: @user.id })
    end
  end
end