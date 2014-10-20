class LoginController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "it worked"
    else
      flash.now[:error] = "Your email or password was WRONG."
      render :new
    end
  end

  def destroy
     session[:current_user_id] = nil
    redirect_to root_path, notice: "DON'T GO AHHHH"

  end



end
