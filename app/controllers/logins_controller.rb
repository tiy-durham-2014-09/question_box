class LoginsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      render :new, notice: "Incorrect username and/or password."
    end
  end
end
