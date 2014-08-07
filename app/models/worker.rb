class Worker < ActiveRecord::Base
	validates :name, presence: true
	validates :area, presence: true
	validates :status, presence: true
	has_many :reviews
end
