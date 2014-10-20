class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def current_user
    unless session[:user_id] == nil
		  @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    current_user
  end

  def authenticate
    current_user_id = session[:user_id]
    unless current_user_id
		  redirect_to new_login_path, notice: "Please sign in."
	  end
  end
end
