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

    # we could also do something like this:
    # def assign_job
    #     @job = Job.find(params[:id])
    #     @job.update(boat_id: params[:job][:boat_id])

    #     if @job.save
    #         redirect_to job_path(@job.id)
    #     flash[:info] = "Job Assigned Successfully"
    #     else
    #     render :show
    #     flash[:info] = "There was an errod assigning the job."
    #     end
    # end

    # and then have a form to assign job
    # <%= form_for @job, url: "/assign_job/#{@job.id}", method: :put do |j| %>
    #   <%= j.label "Boat Name" %>
    #   <%= j.collection_select(:boat_id, @boats, :id, :name) %>
    #   <%= j.submit "Assign Job" %>
    # <% end %>

    # and in the routes put "/assign_job/:id" => "jobs#assign_job"
    
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
