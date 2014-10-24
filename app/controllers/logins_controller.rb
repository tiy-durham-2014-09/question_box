class LoginsController < ApplicationController

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:current_user_id] = @user.id
			redirect_to root_path, notice: "You have logged in!"
		else
			 flash.now[:error] = "Wrong email or password."
			render :new
		end
	end

	def destroy
		session[:current_user_id] = nil
		flash[:notice] = "You logged out"
		redirect_to root_path
	end
	
	def login_params
		params.require(:login).permit(:email, :password)
	end
end
