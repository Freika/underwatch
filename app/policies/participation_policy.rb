class ParticipationPolicy < ApplicationPolicy
  def destroy?
    event_author? || request_author?
  end

  def approve?
    event_author?
  end

  def event_author?
    record.event.author_id == user.id
  end

  def request_author?
    record.user_id == user.id
  end
end
