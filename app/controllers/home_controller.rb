class HomeController < ApplicationController
    
    def index
        @boats = Boat.where(user_id: current_user).all
    end
    
end
