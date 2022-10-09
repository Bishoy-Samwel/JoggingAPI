class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    @user.has_any_role? :manager, :admin
  end

  def show?
    @user.has_any_role? :manager, :admin
  end

  def create?
    @user.has_any_role? :manager, :admin
  end

  def update?
    @user.has_any_role? :manager, :admin
  end

  def delete?
    @user.has_any_role? :manager, :admin
  end

end
