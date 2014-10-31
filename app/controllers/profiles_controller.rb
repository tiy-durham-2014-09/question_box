class ProfilesController < ApplicationController
    before_action :authenticate


  def show
  end

	def edit
	end


  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, success: "You successfully deleted your profile."
  end


	def update

		respond_to do |format|
			if @profile.update(profile_params)
				format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
				format.json { render :show, status: :ok, location: @profile }
			else
				format.html { render :edit }
				format.json { render json: @profile.errors, status: :unprocessable_entity }
			end
		end
	end
end

