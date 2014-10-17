class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
		@current_user ||= User.find(session[:current_user_id])
  end

  def authenticate
	  @user = User.find_by_email(params[:email])
	  if @user.password == params[:password]
		  current_user = session[:current_user_id]
	  else
		  redirect_to home_url
	  end
  end
end
