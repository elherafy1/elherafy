#encoding: UTF-8
class JobsController < ApplicationController
	before_filter :authenticate_admin! , :except => [:show, :index]

	def new
    	@job = Job.new
  	end

  	def create
  		@job = Job.new(job_params)

	    respond_to do |format|
	      if @job.save
	        
	        format.html { redirect_to @job, notice: 'تمت العملية بنجاح' }
	        format.json { render :show, status: :created, location: @job }
	      else
	        format.html { render :new }
	        format.json { render json: @job.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def edit
  		@job = Job.find(params[:id])
  	end

  	def update
  		@job = Job.find(params[:id])
    	respond_to do |format|
	      	if @job.update(job_params)
	        	format.html { redirect_to @job, notice: 'تمت العملية بنجاح' }
	        	format.json { render :show, status: :ok, location: @job }
	      	else
	        	format.html { render :edit }
	        	format.json { render json: @job.errors, status: :unprocessable_entity }
			end
		end
	end
	
  	def show
  		@job = Job.find(params[:id])
  	end

  	def index
  		@jobs = Job.all
  	end

  	def destroy
  		@job = Job.find(params[:id])
	    @job.destroy
	    respond_to do |format|
	      format.html { redirect_to jobs_url, notice: 'تمت العملية بنجاح' }
	      format.json { head :no_content }
    end
  end

  	private

    def job_params
      params.require(:job).permit(:name, :picture)
    end

end