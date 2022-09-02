class PostPolicy < ApplicationPolicy
  def index?
    true
  end
  def update?
    user.present?
  end
  def create?
    user.present?
  end
  def destroy?
    return true if user.present? && user.id == record.user_id
  end
  def new?
    user.present?
  end
end