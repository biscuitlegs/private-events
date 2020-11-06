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

  def update
    @event = Event.find(params[:id])

    #For adding a User to guests association
    if params[:event][:invited_user]
      @invited_user = User.find(params[:event][:invited_user])
      @event.guests << @invited_user
    end

    redirect_to @event
  end


  private

  def event_params
    params.require(:event).permit(:name, :date)
  end
end
