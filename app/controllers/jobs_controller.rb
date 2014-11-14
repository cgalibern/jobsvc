class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @service_id = params[:service_id]
    @jobs = Job.all.where(service_id: @service_id)
  end

  def show
  end

  def new
    @job = Job.new
    @job.service_id = params[:service_id]
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.service_id = params[:service_id]

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    service_id=@job.service_id
    @job.destroy
    respond_to do |format|
      format.html { redirect_to service_jobs_url service_id, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render file: "public/404.html", status: 404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:jobname, :status)
    end
end
