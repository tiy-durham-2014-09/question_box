class LoginsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      if @user.activated?
        session[:current_user_id] = @user.id
        redirect_to root_path
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        render :new
      end
    else
      message  = "Invalid username/password"
      flash[:warning] = message
      render :new
    end
  end



  def destroy
    session[:current_user_id] = nil
    redirect_to root_url
  end
end
