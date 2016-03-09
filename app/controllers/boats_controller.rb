class BoatsController < ApplicationController
    def index
        @boats = Boat.where(user_id: current_user.id)
    end
    
    def show
        @jobs = Job.where(boat_id: nil)
    end
    
    def edit
        @boat = Boat.find(params[:id])
    end
    
    def update
        @boat = Boat.find(params[:id])
        @boat.update(boat_params)
        redirect_to boats_path
        # Shorten the update logic if you want and have time
    end
    
    def new
        @boat = Boat.new
    end
    
    def create
        @boat = Boat.where(user_id: current_user.id).create(boat_params)
        redirect_to "/"
    end
    
    def destroy
        @boat = Boat.find(params[:id])
        if @boat.destroy
            flash[:notice] = "Boat successfully deleted"
            redirect_to :back
        else
            flash[:alert] = "Error! Error! Error!"
        end
    end
    
    private
    def boat_params
        params.require(:boat).permit(:name, :capacity, :location) 
    end
    
end
