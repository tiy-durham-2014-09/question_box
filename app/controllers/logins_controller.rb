class LoginsController < ApplicationController
  def show
    @login = Login.new
  end

  def create
    @login = Login.new(login_params)

    if @login.valid? && @login.authenticated?
      session[:current_user_id] = @login.user.id
      # TODO redirect
      render nothing: true, status: :created
    else
      render :show
    end
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
