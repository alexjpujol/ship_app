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
        @job = Job.create(name: params[:job][:name], user_id: current_user.id, containers_needed: params[:job][:containers_needed], cargo: params[:job][:cargo], cost: params[:job][:cost], destination: params[:job][:destination])
        redirect_to jobs_path
    end
    
    def edit
        @job = Job.find(params[:id])
    end
    
    def update
        @job = Job.find(params[:id])
        @job.update(name: params[:job][:name], user_id: current_user.id, containers_needed: params[:job][:containers_needed], cargo: params[:job][:cargo], cost: params[:job][:cost], destination: params[:job][:destination])
        redirect_to job_path
    end
    
    def destroy
        @job = Job.find(params[:id])
        if @job.destroy
            flash[:notice] = "Job successfully deleted"
            redirect_to jobs_path
        else
            flash[:alert] = "Error! Error! Error!"
        end
    end
    
end
