class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def admin?
    if current_user
      current_user.admin
    end
  end

  # Check if reservation is owned by current user
  def owned?(reservation)
    if current_user
      current_user == reservation.user 
    end
  end

  # Check if accessing user account is current user's
  def self?
    current_user == params[:id] || current_user == params[:user_id]
  end
end
