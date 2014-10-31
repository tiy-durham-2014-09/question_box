class ProfilesController < ApplicationController
    before_action :authenticate


  def create

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, success: "You successfully deleted your profile."
  end


  private

end
