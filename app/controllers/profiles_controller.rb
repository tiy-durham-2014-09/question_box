class ProfilesController < ApplicationController
	# before_action :authenticate, except: [:new, :create]
	# before_action :set_profile, only: [:show, :edit, :update, :destroy]

	def index
		@profiles = Profile.all
	end

	def show
		@profile = Profile.find(params[:id])
	end

	def new
		@profile = Profile.new
	end

	def edit
	end

	def create

		@profile = current_user.build_profile(profile_params)

		respond_to do |format|
			if @profile.save
				format.html { redirect_to root_path, notice: 'Welcome to ' + site_name }
				format.json { render :show, status: :created, location: @profile }
			else
				format.html { render :new }
				format.json { render json: @profile.errors, status: :unprocessable_entity }
			end
		end
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


	private
	# Use callbacks to share common setup or constraints between actions.
	# def set_profile
	# 	if logged_in?
	# 		@profile = current_user.profile
	# 	else
	# 		@profile = Profile.find(params[:id])
	# 	end
	# end

	def ensure_user_owns_profile
		if @profile.user != current_user
			redirect_to root_path, flash: {alert: "You tried to access a profile that doesn't belong to you."}
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def profile_params
		params.require(:profile).permit(:bio, :location, :website)
	end
end
