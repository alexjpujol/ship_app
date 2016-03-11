class JobsController < ApplicationController
    
    def index
        @jobs = Job.all
    end
    
    def show
        @job = Job.find(params[:id])
    end
    
    def new
        @job = Job.new
    end
    
    def create
        @job = Job.where(user_id: current_user.id).create(job_params)
        redirect_to jobs_path
    end
    
    def edit
        @job = Job.find(params[:id])
    end
    
    def update
        @job = Job.find(params[:id])
        @job.update(job_params)
        redirect_to job_path
        
        @jobs.update(boat_id: params[:id])
    end
    
#    def assign_job
#        @job = Job.where(boat_id: nil)
#        @job.boat_id = Boat.find(params[:id])
#        @job.save
#        
#    end
    
    def destroy
        @job = Job.find(params[:id])
        if @job.destroy
            flash[:notice] = "Job successfully deleted"
            redirect_to jobs_path
        else
            flash[:alert] = "Error! Error! Error!"
        end
    end
    
    private
    def job_params
        params.require(:job).permit(:name, :containers_needed, :cargo, :cost, :destination, :boat_id) 
    end


    
end
