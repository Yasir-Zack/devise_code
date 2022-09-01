class PostPolicy < ApplicationPolicy
  def index?
    true
  end
  def update?
    user.present?
  end
  def destroy?
    user.present?
  end
end