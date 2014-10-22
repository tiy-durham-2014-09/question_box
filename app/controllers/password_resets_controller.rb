class PasswordResetsController < ApplicationController
  before_action :set_password_reset, only: [:edit, :update]

  def new
  end

  def create
    @password_reset = PasswordReset.new(email: params[:email])

    if @password_reset.save || @password_reset.errors[:email].empty?
      redirect_to root_path, success: "A password reset email has been sent if that email exists in our system."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user = @password_reset.user
    if @user.update(password_params)
      @password_reset.update(expired: true)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_password_reset
    @password_reset = PasswordReset.find_by!(key: params[:id])
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
