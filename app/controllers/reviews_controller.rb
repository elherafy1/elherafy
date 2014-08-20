class ReviewsController < ApplicationController

	before_filter :set_worker
	before_filter :set_review, :only => [:destroy]
	
	def new
		@review = @worker.reviews.build
	end

	def index
	  @reviews = @worker.reviews#.all.sort{|x,y| x.average_rate <=> y.average_rate}.reverse
	end

	def create
			@review = @worker.reviews.build(review_params)

		respond_to do |format|
			if @review.save
				format.html { redirect_to @worker, notice: 'Review was sent.' }
			else
				format.html { render :new }
			end
		end
	end

	def destroy
		@review.destroy
	respond_to do |format|
	  format.html { redirect_to worker_reviews_path(@worker) , notice: 'review was successfully destroyed.' }
	  format.json { head :no_content }		
	end
end

	private

	def set_review
		@review = Review.find(params[:id])
	end

	def review_params
      params.require(:review).permit(:price, :clean, :quilty, :disicpline, :treatment, :comment, :client_name, :client_phone, :client_addres, :client_email)
    end

    def set_worker
    	@worker= Worker.find(params[:worker_id])
    end
end
