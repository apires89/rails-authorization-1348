class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user:user)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    #current_user needs to be the owner of the restaurant
    #@restaurant.user == current_user
    #same as up but different syntax
    record.user == user || user.admin?
  end

  def destroy?
    record.user == user || user.admin?
  end



end
