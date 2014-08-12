class Worker < ActiveRecord::Base
	validates :name, presence: true
	validates :area, presence: true
	validates :status, presence: true
	validates :kind, presence: true
	has_many :reviews, :dependent => :destroy

	validates_presence_of :reviews
	validates_associated :reviews
	accepts_nested_attributes_for :reviews
		

	def average_rate
		rate = Review.where(:worker_id => self.id).average(:price) + Review.where(:worker_id => self.id).average(:clean) + Review.where(:worker_id => self.id).average(:quilty) + Review.where(:worker_id => self.id).average(:disicpline) + Review.where(:worker_id => self.id).average(:treatment)
	end

end
