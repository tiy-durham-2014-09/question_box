class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
