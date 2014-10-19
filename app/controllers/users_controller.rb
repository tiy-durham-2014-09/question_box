class UsersController < ApplicationController

	def new
		@user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
	    session[:current_user_id] = @user.id
		  redirect_to root_path, :notice => "Logged in as #{@user.name}!"
    else
      render :new
    end
  end

  private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

