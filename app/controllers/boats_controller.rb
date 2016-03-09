class BoatsController < ApplicationController
    def index
        
    end
    
    def show
        
    end
    
    def edit
        @boat = Boat.find(params[:id])
    end
    
    def update
        @boat = Boat.find(params[:id])
        @boat.update(name: params[:boat][:name], capacity: params[:boat][:capacity], location: params[:boat][:location])
        redirect_to "/"
        # Shorten the update logic if you want and have time
    end
    
    def new
        @boat = Boat.new
    end
    
    def create
        @boat = Boat.create(user_id: current_user.id, name: params[:boat][:name], capacity: params[:boat][:capacity], location: params[:boat][:location])
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
    
end
