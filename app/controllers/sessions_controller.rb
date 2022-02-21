class SessionsController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def login
    user = User.find_by(username: params[:username])

    #authenticate user credentials
    if user.present? && user.authenticate(params[:password])

      #set session and redirect on success
      session[:user_id] = user.id
      redirect_to todo_lists_path
    else
      #error massage fail
      flash[:alert] = "Invalid credentials"
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to auth_login_path, notice: "Logged out"
  end
end
