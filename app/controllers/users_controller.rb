class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @user = User.find_by(params[:token])
  end 
  def new
    @user = User.new
  end
  
  def account_confirmation
    @user = User.find_by_token(params[:token])
    if(@user)
      @user.update_column(:click, true)
      @user.update_column(:token, nil)
      redirect_to new_login_path, notice: "Yay, your account has been confirmed!"
    else
      redirect_to new_login_path, notice: "woops, your account could not be confirmed"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # @user.send_confirmation
      UserMailer.registration_confirmation(@user).deliver
      redirect_to user_path(@user), notice: 'User was successfully created.'
      # render nothing: true, status: :created
    else
      render :new
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
