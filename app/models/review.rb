class Review < ActiveRecord::Base
	validates :price, :presence => true
	validates :clean, :presence => true
	validates :quilty, :presence => true
	validates :disicpline, :presence => true
	validates :treatment, :presence => true
	validates :client_name, :presence => true
	validates :client_phone, :presence => true
	validates :client_email, :presence => true
	belongs_to :worker
end
