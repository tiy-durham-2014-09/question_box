class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
		@current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    current_user
  end

  def log_out
    session[:user_id] = nil
    @current_user = nil
    redirect_to new_login_path
  end

  def authenticate
	  @user = User.find_by_email(params[:email])
	  if @user.password != params[:password]
		  redirect_to new_login_path, notice: "Please sign in."
	  end
  end
end
