class UsersController < ApplicationController
  def new
    # In case user is logged in redirect to todo_lists_path
    if session[:user_id]
      # Setting logged in user
      Current.user = User.find_by(id: session[:user_id])
      redirect_to todo_lists_path
    end
    @user = User.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to auth_login_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
