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
      
      if @user.nil? 
        @user = User.new
        @user.errors.add(:email, message: "is not registered.")
      else
        @user.errors.add(:password, message: "does not match.")
      end      

      if params[:user][:email].empty?
        @user.errors.messages.delete(:email)
        @user.errors.add(:email,  message: "can't be blank.")
      end
      
      @errors = @user.errors.full_messages

      render 'new'
    end
  end

  def google_signin
    @user = User.find_by(email: auth[:info][:email])
    if @user
      session[:user_id] = @user.id
      redirect_to @user, alert: "Successfully logged in!"      
    else
      password = SecureRandom.base64(12)
      @user = User.create(name: auth[:info][:name], email: auth[:info][:email], password: password)
      if @user.errors.empty?
        session[:user_id] = @user.id
        session[:tmp_password] = password if @user.password
        redirect_to edit_password_path(@user), alert: "Set your password."
      else
        @alert = "Google log in failed..."
        render 'new'
      end
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
