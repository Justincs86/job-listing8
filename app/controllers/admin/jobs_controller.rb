class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :new, :edit, :update, :destroy]
  before_action :require_is_admin

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
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Job created"
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Update Successful"
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
      flash[:alert] = "Job Deleted"
      redirect_to admin_jobs_path
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :lower_wage_bound, :upper_wage_bound, :contact_email, :is_hidden)
  end

end
