class EventPolicy < ApplicationPolicy
  def edit?
    author?
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  def author?
    record.user_id == user.id
  end
end
