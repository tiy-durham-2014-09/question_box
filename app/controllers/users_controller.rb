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

  def update
	  respond_to do |format|
		  if @user.update(user_params)
			  format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
			  format.json { render "/profile/show", status: :ok, location: @user }
		  else
			  format.html { render :edit }
			  format.json { render json: @user.errors, status: :unprocessable_entity }
		  end
	  end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :location, :github_url, :so_url, :twitter_url)
  end
end
