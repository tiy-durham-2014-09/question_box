class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
  @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def authenticate
    current_user_id = session[:current_user_id]
    unless current_user_id
      redirect_to login_new_path, notice: "SAWEE"
    end
  end
end
