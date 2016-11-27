class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @participation = @event.participations.find_by(user_id: current_user.id)
    @requests = @event.participations
  end

  def new
    @event = current_user.events.build
  end

  def edit
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.author_id = current_user.id

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @event

    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @event = Event.includes(:participations, :users).find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :mode, :appointed_at)
  end
end
