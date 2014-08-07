class ReviewsController < ApplicationController


	def new
		#@review = Review.new
	end


	def create
		@review = Review.new(review_params)

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

end