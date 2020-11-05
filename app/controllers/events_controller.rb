class EventsController < ApplicationController
  before_action :user_signed_in?, only: [:new, :create]


  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = "Event successfully created."
      redirect_to @event
    else
      flash[:error] = "Error creating event."
      render :new
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :date)
  end
end
