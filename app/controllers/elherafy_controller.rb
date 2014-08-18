class ElherafyController < ApplicationController

	def home
		
	end

	def create
		
	end

	def about
	end

	def mabalat
		worker_type=params[:worker_type]
		@workers= Worker.where(:kind => worker_type)
	end


end