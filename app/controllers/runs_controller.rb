class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [
    :new, :edit, :create, :update, :destroy
  ]

  def index
    @runs = Run.all
  end

  def show
  end

  def new
    @run = Run.new
    @events = Event.all.map { |e| [e.title, e.id] }
  end

  def edit
    @events = Event.all.map { |e| [e.title, e.id] }
  end

  def create
    @run = current_user.runs.build(run_params)

    if @run.save
      redirect_to @run, notice: 'Run was successfully created.'
    else
      render :new
    end
  end

  def update
    if @run.update(run_params)
      redirect_to @run, notice: 'Run was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @run.destroy
    redirect_to runs_url, notice: 'Run was successfully destroyed.'
  end

  private
    def set_run
      @run = Run.find(params[:id])
    end

    def run_params
      params.require(:run).permit(:title, :description, :event_id)
    end
end
