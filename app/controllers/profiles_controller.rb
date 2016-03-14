class ProfilesController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def show
		@profile = Profile.where(user_id: params[:id]).first
	end

	def new
	end

	def create
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])
		@profile.update(profile_params)

		redirect_to :back
	end

	def destroy
	end

	private
	def profile_params
		params.require(:profile).permit(:user_id, :username)
	end

end
