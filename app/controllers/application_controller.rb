class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?, :logged_in?, :site_name

  private

  def current_user
	  @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def current_user? other_user
	  true if @current_user == other_user
  end

  def logged_in?
	  current_user
  end

  def site_name
	  "Question Box"
  end

  def authenticate
	  current_user_id = session[:current_user_id]
	  unless current_user_id
		  redirect_to new_login_path, notice: "Please sign in to use " + site_name
	  end
  end

end
