class LoginsController < ApplicationController
	def new

	end

	def create
		@user = User.find_by(email: user_params[:email])

		if @user && @user.authenticate(user_params[:password])
			session[:current_user_id] = @user.id
			redirect_to root_path
		else
			render :new
		end
	end

	def destroy

	end

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
