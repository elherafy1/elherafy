class ElherafyController < ApplicationController

	def home
    	@worker = Worker.where(:kind => 'mabalat').sort{|x,y| x.average_rate <=> y.average_rate}.reverse	
    	@max_mabalat = Worker.max_mabalat	
    	@max_sabak = Worker.max_sabak
    	@max_naggar = Worker.max_naggar
    	#puts "MAX NAGGAR ISSSSSSSSS"
    	#puts @max_naggar.inspect

	end

	def create
		
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