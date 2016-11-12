module EventsHelper
  def players_icon(event)
    event.participations.size >= 6 ? 'check green' : 'remove red'
  end
end
