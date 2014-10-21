class LoginsController < ApplicationController
  def new
	  @login = Login.new
  end

  def create
	  @login = Login.new(login_params)

	  if @login.valid? && @login.authenticated?
		  session[:current_user_id] = @login.user.id
		  redirect_to root_path, notice: "Logged in as #{current_user.name}!"
	 else
		  flash.now[:error] = "Your email or password was incorrect."
		  render :new
	 end
  end

  def destroy
	 session[:current_user_id] = nil
	 redirect_to root_path, notice: "You have been logged out."
  end

  private

  def login_params
	  params.require(:login).permit(:email, :password)
  end

end
