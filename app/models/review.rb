class Review < ActiveRecord::Base
	validates :price, :presence => true, :if => :enable_strict
	validates :clean, :presence => true, :if => :enable_strict
	validates :quilty, :presence => true, :if => :enable_strict
	validates :disicpline, :presence => true, :if => :enable_strict
	validates :treatment, :presence => true, :if => :enable_strict

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
