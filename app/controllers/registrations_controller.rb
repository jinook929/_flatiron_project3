class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
    @event = Event.find_by(id: params[:event_id])
  end

  def create
    @registration = Registration.new(event_id: params[:event_id], user_id: current_user.id, family: params[:registration][:family])
    if @registration.save
      redirect_to user_events_path(current_user)
    else
    end
  end

  def destroy
    if owned?
      registration = Registration.find_by(id: params[:id])
      registration.event.spot += 1
      registration.save
      registration.destroy
      redirect_to user_events_path(current_user)
    else
      redirect_back fallback_location: user_path(current_user)
    end
  end
end
