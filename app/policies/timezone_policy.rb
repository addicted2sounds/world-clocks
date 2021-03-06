class TimezonePolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user.can_manage_alias_timezones? or record.user.id.equal? user.id
  end

  def destroy?
    update?
  end

  def permitted_attributes
    attrs = [:name, :city, :difference]
    attrs.push :user_id if user.can_manage_alias_timezones?
    attrs
  end

  class Scope < Scope
    def resolve
      return scope.all if user.can_manage_alias_timezones?
      scope.joins(:user).where(users: { id: user.id })
    end
  end
end