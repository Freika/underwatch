class EventNotifierWorker
  include Sidekiq::Worker

  def perform(event_id)
    event = Event.find(event_id)

    EventMailer.notify_author(event.author, event).deliver_later
    event.participations.each { |request| EventMailer.notify_user(request.user) }
  end
end
