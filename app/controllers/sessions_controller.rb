class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user, alert: "Successfully logged in!"
    else
      @alert = "Log in failed..."
      @user.nil? ? (@errors = ["Email is not registered."]) : (@errors = ["Password does not match."])
      @errors = ["Email can't be blank."] if params[:user][:email].empty?
      @user = User.new
      render 'new'
    end
  end

  def google_signin
    # binding.pry
    @user = User.find_or_create_by(email: auth[:info][:email])
    @user.name = auth[:info][:name]
    password = SecureRandom.base64(12)
    @user.password = password if User.find_by(email: auth[:info][:email]).nil?
    if @user.save
      session[:user_id] = @user.id
      session[:tmp_password] = password if @user.password
      redirect_to @user, alert: "Successfully logged in!"
    else
      @alert = "Google log in failed..."
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path, alert: "Successfully logged out"
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
