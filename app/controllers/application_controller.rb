class ApplicationController < ActionController::Base
  before_action :set_current_user # before any action grab logged in user.

  def set_current_user
    if session[:user_id]
      # Setting logged in user
      Current.user = User.find_by(id: session[:user_id])
    end
  end
end
