class Review < ActiveRecord::Base
	
	#validates :rateingA, presence: true
	belongs_to :worker
end
