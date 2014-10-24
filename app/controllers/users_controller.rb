class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, status: :created, notice: "Account cerification email sent - please check it to log in!"
    else
      redirect_to new_user_path, notice: "Invalid registration information."
    end
  end

  def verify
    @user = User.find_by(email: params[:user.email])
    @key = params[:key]
    if @key == @user.each_key
      @user.update(verified: true)
    else
    # untested, may not work

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
