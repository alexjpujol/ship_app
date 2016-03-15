class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
    end
    
    def destroy    
    end

    def show
    end
    
    def following
        @user = User.find(params[:id])
        @following = @user.relationships
    end
    
    
    
end
