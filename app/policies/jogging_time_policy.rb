class JoggingTimePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if @user.has_role? :admin
        scope.all
      else
        scope.all.merge(@user.jogging_times)
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
    # @user.has_any_role?  :admin
  end

  def update?
    true
  end

  def delete?
    true
  end

end
