class EventsController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :redirect_if_not_admin_or_owner, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @events = User.find_by(id: params[:user_id]).events.order(date: :desc, time: :desc)
    else
      @events = Event.all.order(date: :desc, time: :desc)
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @registration = Registration.find_by(event_id: params[:id], user_id: params[:user_id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.toggle(:onsite) if params[:event][:onsite]
    if @event.save
      redirect_to @event, alert: "Event Successfully Created!"
    else
      @errors = @event.errors.full_messages
      render 'new'
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.update(event_params)
    @event.toggle(:onsite) if (params[:event][:onsite].nil? && @event.onsite) || (params[:event][:onsite] && !@event.onsite)
    @event.save
    redirect_to @event
  end

  def onsite
    @events = Event.onsite_events
    @note = "On-Site"
    render "event_type"
  end

  def virtual
    @events = Event.virtual_events
    @note = "Virtual"
    render "event_type"
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :time, :spots, :description)
  end
end
