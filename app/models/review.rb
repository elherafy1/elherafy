class Review < ActiveRecord::Base
	validates :price, :presence => true
	validates :clean, :presence => true
	validates :quilty, :presence => true
	validates :disicpline, :presence => true
	validates :treatment, :presence => true

	validates :client_name, :presence => true, :if => :enable_strict
	validates :client_phone, :presence => true, :if => :enable_strict
	validates :client_email, :presence => true, :if => :enable_strict

	
	belongs_to :worker

	def enable_strict
		if self.worker.nil?
			false
		else
			true
		end
	end
end
