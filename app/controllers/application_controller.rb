class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    if !current_user
      redirect_to login_path
    end
  end

  def admin?
    if current_user
      current_user.admin
    end
  end

  def redirect_if_not_admin
    binding.pry
    if current_user
      if !current_user.admin
        redirect_back fallback_location: user_path(current_user), alert: "You requested the page only Admin can access."
      end
    end
  end

  # Check if reservation is owned by current user
  def registration_owned?
    if current_user
      current_user == Registration.find_by(id: params[:id]).user
    end
  end

  # Check if accessing user account is current user's
  def self?
    current_user.id == params[:id].to_i
  end
end
