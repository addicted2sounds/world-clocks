class UserPolicy < ApplicationPolicy
  def index?
    p user.can_manage_users?
    user.can_manage_users?
  end

  def create?
    true
  end

  def update?
    user.can_manage_users? or record.user.id.equal? user.id
  end

  def destroy?
    update?
  end

  def permitted_attributes
    attrs = [:email, :password, :password_confirmation]
    attrs.push :role if user.try :can_manage_alias_timezones?
    attrs
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end