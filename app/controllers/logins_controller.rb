class LoginsController < ApplicationController
  def show
    @login = Login.new
  end

  def create
    @login = Login.new(login_params)

    if @login.valid? && @login.authenticated?
      session[:current_user_id] = @login.user.id
      redirect_to root_path, success: "Logged in successfully."
    else
      render :show
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, success: "Logged out successfully."
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
