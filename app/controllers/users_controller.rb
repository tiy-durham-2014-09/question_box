class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path, success: "You have successfully registered."
    else
      render :new
    end
  end

  def show
	  @user = User.find(params[:id])
  end

  def edit
	  @user = User.find(params[:id])
  end

  def destroy
	  @user = User.find(params[:id])
		@user.destroy
		redirect_to root_path, success: "You have successfully deleted your account."
  end

  def update
	  @user = User.find(params[:id])
	  respond_to do |format|
		  if @user.update(user_params)
			  format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
			  format.json { render "/questions/home", status: :ok, location: @user }
		  else
			  format.html { render :edit }
			  format.json { render json: @user.errors, status: :unprocessable_entity }
		  end
	  end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :location, :github_username, :stack_overflow_url, :twitter_username)
  end
end
