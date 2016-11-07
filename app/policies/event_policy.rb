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

  def participate?
    !author?
  end

  def author?
    record.author_id == user.id
  end
end
