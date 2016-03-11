class JobsController < ApplicationController
    
    def index
        @jobs = Job.where(boat_id: nil)
    end
    
    def show
        @job = Job.find(params[:id])
        @jobs = Job.all
    end
    
    def new
        @job = Job.new
    end
    
    def create
        @job = Job.where(user_id: current_user.id).new(job_params)
        if @job.save
            flash[:notice] = "BOATS AND HOES!"
            redirect_to jobs_path
        else
            flash[:notice] = "Nicht, nicht! Invalid parameter!"
            render :new
        end
    end
    
    def edit
        @job = Job.find(params[:id])
    end
    
    def update
        @job = Job.find(params[:id])
        @job.update(job_params)
        redirect_to job_path
    end

#    def assign_job
#        @job = Job.find(params[:id])
#        @job.update(boat_id: params[:job][:boat_id])
#        
#        if @job.save
#            redirect_to job_path(@job.id)
#            flash[:info] = "Job Assigned! Ach Ja!"
#        else
#            render :show
#            flash[:info] = "Thre was an ERROR!"
#        end
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
