class LoginController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to new_question_path, notice: "it worked"
    else
      flash.now[:error] = "Your email or password was WRONG BIATCH."
      render :new
    end
  end

  def destroy
    if session[:current_user_id] = nil
    redirect_to homepage_index_path, notice: "DON'T GO AHHHH"
    end
  end



end
