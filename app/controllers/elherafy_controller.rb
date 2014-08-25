class ElherafyController < ApplicationController

	def home
    	@jobs = Job.all	
	end


	def contact
		
	end

	def about
	end

	def mabalat
		worker_type=params[:worker_type]
		@workers= Worker.where(:kind => worker_type).sort{|x,y| x.average_rate <=> y.average_rate}.reverse
	end


end