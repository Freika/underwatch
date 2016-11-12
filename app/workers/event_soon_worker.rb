class EventSoonWorker
  include Sidekiq::Worker

  def perform
    events = Event.where(appointed_at: Time.current..20.minutes.from_now)
    if events.any?
      events.each { |e| EventNotifierWorker.perform_async(e.id) }
    end
  end
end
