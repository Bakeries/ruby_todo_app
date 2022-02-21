class SessionsController < ApplicationController
  def index

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
      render :index
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to auth_login_path, notice: "Logged out"
  end
end
