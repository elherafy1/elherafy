class ElherafyController < ApplicationController

	def home
    	@worker = Worker.where(:kind => 'mabalat').sort{|x,y| x.average_rate <=> y.average_rate}.reverse		
	end

	def create
		
	end

	def about
	end

	def mabalat
		worker_type=params[:worker_type]
		@workers= Worker.where(:kind => worker_type).sort{|x,y| x.average_rate <=> y.average_rate}.reverse
	end


end