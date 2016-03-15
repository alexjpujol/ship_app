class BoatsController < ApplicationController
    def index
        @boats = Boat.all
    end
    
    def show
        @jobs = Job.where(boat_id: params[:id])
        @boat = Boat.find(params[:id])
        @relationship = Relationship.new
        @follower = Relationship.where(boat_id: params[:id], user_id: current_user.id).first
    end
    
    def edit
        @boat = Boat.find(params[:id])
    end
    
    def follow
        
    end
    
    def update
        @boat = Boat.find(params[:id])
        @boat.update(boat_params)
        redirect_to boat_path
    end
    
    def new
        @boat = Boat.new
    end
    
    def create
        @boat = Boat.where(user_id: current_user.id).new(boat_params)
        if @boat.save
            flash[:notice] = "BOATS AND HOES!"
            redirect_to boats_path
        else
            flash[:notice] = "Nicht, nicht! Invalid location."
            render :new
        end
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
        params.require(:boat).permit(:name, :capacity, :location, :avatar) 
    end
    
end
