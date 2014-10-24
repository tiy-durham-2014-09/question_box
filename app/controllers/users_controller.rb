class UsersController < ApplicationController
  before_action :set_user
  # before_action :set_activation

  def index
    @users = User.all
  end

  # def show
  #   @user = User.find_by(params[:id])
  # end

  def new
    @user = User.new
  end

  def activation
    @user = User.find_by([:id])
    @user.update_column(activated: true)
    redirect_to new_login_path, success: "Your account has been activated, please sign in."
  end

  # def set_activation
  #   unless @user.activated == true
  #     redirect_to root_path, notice: "You must be logged on to visit this site."
  #   end
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      ActivationMailer.account_activation(@user, @key).deliver
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def to_s
    name
  end

  private




  def set_user
    @user = User.find_by(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
