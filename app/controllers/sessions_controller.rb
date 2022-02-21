class SessionsController < ApplicationController
  def index
    # In case user is logged in redirect to todo_lists_path
    if session[:user_id]
      # Setting logged in user
      Current.user = User.find_by(id: session[:user_id])
      redirect_to todo_lists_path
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
      render :index
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to auth_login_path
  end
end
