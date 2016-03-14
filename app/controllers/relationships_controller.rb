class RelationshipsController < ApplicationController
    
    def new
        @relationship = Relationship.new
    end
    
    def create
        @relationship = Relationship.create(relationship_params)
    end
    
    private
    def relationship_params
        params.require(:relationship).permit(:boat_id, :user_id)
    end
    
end
