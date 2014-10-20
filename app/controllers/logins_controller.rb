class LoginsController < ApplicationController
  def new
	  @user = User.find_by(email: params[:email])
  end

  def create
	 @user = User.find_by(email: params[:email])
	 if @user && @user.authenticate(params[:password])
		  session[:current_user_id] = @user.id
		  redirect_to root_path, :notice => "Logged in as #{current_user.name}!"
	 else
		  flash.now[:error] = "Your email or password was incorrect."
		  render :new
	 end
  end

  def destroy
	 session[:current_user_id] = nil
	 redirect_to root_path, notice: "You have been logged out."
  end
end
