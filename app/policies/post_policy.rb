class PostPolicy < ApplicationPolicy
  def index?
    true
  end
  def update?
    return true if user.present? && user.id == record.user_id
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