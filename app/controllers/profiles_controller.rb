class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

  end

  def show
  end

  def update
  end

  def delete
  end

  def edit
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
  
end
