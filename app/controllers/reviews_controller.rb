class ReviewsController < ApplicationController

	before_filter :set_worker

	def new
		@review = @worker.reviews.build
	end

	def show
		
	end


	def create
		@review = @worker.reviews.build(review_params)

		if @review.save
			flash[:success] = "Review sent"
			puts "in create action"
			puts "flash is #{flash}"
			redirect_to workers_path
		else
			puts "unsuccessful"
		end
		
			#redirect_to :back
	end

	private

	def review_params
      params.require(:review).permit(:price, :clean, :quilty, :disicpline, :treatment)
    end

    def set_worker
    	@worker= Worker.find(params[:worker_id])
    end
end