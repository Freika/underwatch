class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])

    if event
      current_user.participations.create(event_id: event.id)
      redirect_to event, notice: "You requested participation in \"#{event.title}\". Organizer will soon approve or decline it."
    else
      redirect_to events_path, notice: 'Event wasnt found'
    end
  end

  def destroy
    participation = Participation.find(params[:id])

    authorize participation

    participation.destroy

    redirect_to events_path,
      notice: 'You canceled request to participate in an event.'
  end

  def approve
    event = Event.find(params[:event_id])
    participation = Participation.find(params[:id])

    authorize participation

    participation.update(approved: true)
    EventMailer.request_approved(event, participation.user)
    redirect_to event, notice: 'Request approved.'
  end
end
