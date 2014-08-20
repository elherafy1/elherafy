class Worker < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :area, presence: true
	validates :status, presence: true
	validates :kind, presence: true
	has_many :reviews, :dependent => :destroy

	validates_presence_of :reviews#, :on => :create#, :if => :strict_enabled
	validates_associated :reviews
	accepts_nested_attributes_for :reviews
		

	def average_rate
		rate =  Review.where(:worker_id => self.id).average(:price) + 
				Review.where(:worker_id => self.id).average(:clean) + 
				Review.where(:worker_id => self.id).average(:quilty) + 
				Review.where(:worker_id => self.id).average(:disicpline) + 
				Review.where(:worker_id => self.id).average(:treatment)
	end

	def average_price
		price_rate = Review.where(:worker_id => self.id).average(:price)
	end
	def average_clean
		clean_rate = Review.where(:worker_id => self.id).average(:clean)
	end
	def average_quilty
		quilty_rate = Review.where(:worker_id => self.id).average(:quilty)
	end
	def average_disicpline
		disicpline_rate = Review.where(:worker_id => self.id).average(:disicpline)
	end
	def average_treatment
		treatment_rate = Review.where(:worker_id => self.id).average(:treatment)
	end

	def get_comments
		Review.where(:worker_id => self.id)
	end

	# def strict_enabled
	# 	return true if self.new_object
	# end

end
