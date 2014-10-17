class HomepagesController < ApplicationController
  before_action :authenticate

  def index
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
