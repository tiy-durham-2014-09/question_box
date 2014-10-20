class LoginsController < ApplicationController
  def show
    @user = User.find_by(email: params[:email])
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now[:error] = "Incorrect username or password."
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: "Logged out successfully."
  end


end
