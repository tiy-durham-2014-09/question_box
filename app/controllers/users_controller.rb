class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # TODO redirect
      redirect_to root_path, status: :created
    else
      redirect_to new_user_path, notice: "Invalid registration information."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
