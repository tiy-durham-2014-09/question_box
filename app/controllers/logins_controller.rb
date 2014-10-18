class LoginsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      redirect_to new_login_path, notice: "Incorrect username and/or password."
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_login_path, notice: "Logged out successfully."
  end
end
