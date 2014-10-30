class ProfilesController < ApplicationController
    before_action :authenticate, only: [:new, :create, :vote]
    before_action :set_profile, only: [:show, :vote]

  def new
    @profile = Profile.new
  end

  def create

  end

  def show
    @current_user.profile
  end

  def edit
  end

  def update
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, success: "You successfully eliminated your profile."
  end


  private

end
