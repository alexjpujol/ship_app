class ProfilesController < ApplicationController
    
    def show
        @profile = Profile.where(user_id: params[:id]).first
    end
    
    def edit 
        @profile = Profile.find(params[:id])
    end
    
    def update 
        @profile = Profile.find(params[:id])
        @profile.update(profile_params)
        
        redirect_to profile_path(@profile)
    end
    
    private
    def profile_params
        params.require(:profile).permit(:user_id, :fname, :lname, :avatar)
    end
    
end
