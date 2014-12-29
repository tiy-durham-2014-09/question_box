class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
<<<<<<< HEAD
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
  @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in?
  current_user
  end

  def authenticate
    current_user_id = session[:current_user_id]
    unless current_user_id
      redirect_to new_login_path, notice: "sorry, you can't do that"
    end
  end

  def all_questions_params
    params.require(:questions).permit(:title, :text, :user)
=======
  # protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  add_flash_types :success, :info, :warning, :alert

  private

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to login_path unless logged_in?
>>>>>>> 66bf726a78e18dafded69c8dc07dc8b10c383a19
  end
end
