class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def new?
    @user.admin?
  end

  def edit?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
