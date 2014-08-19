class ReviewsController < ApplicationController

	before_filter :set_worker
	
	def new
		@review = @worker.reviews.build
	end

	def show
		
	end


	def create
		@review = @worker.reviews.build(review_params)

	respond_to do |format|
		if @review.save
			format.html { redirect_to workers_path, notice: 'Review was sent.' }
		else
			format.html { render :new }
		end
	end
	end

	private

	def review_params
      params.require(:review).permit(:price, :clean, :quilty, :disicpline, :treatment, :comment, :client_name, :client_phone, :client_addres, :client_email)
    end

    def set_worker
    	@worker= Worker.find(params[:worker_id])
    end
end