class ApplicationController < ActionController::Base
  helper_method :current_user # Allows usage in views

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
