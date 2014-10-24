class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Please check your email for a validation email.' }
      else
        format.html { render :new }
      end
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
