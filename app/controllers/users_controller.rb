class UsersController < ApplicationController
    def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def show
  @user = User.find(params[:id])
end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to the Question Box!"
      # TODO redirect
      render nothing: true, status: :created
       redirect_to login_new_path
    else
      render :new
    end
  end
    def to_s
    name
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
