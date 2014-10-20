class LoginsController < ApplicationController

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:current_user_id] = @user.id
			redirect_to root_path, notice: "You have logged in!"
		else
			render :new
		end
	end

	def destroy
		session[:current_user_id] = nil
		flash[:notice] = "You logged out"
		redirect_to root_path
	end

end
