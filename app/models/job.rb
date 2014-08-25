#encoding: UTF-8
class Job < ActiveRecord::Base

	validates :name, presence: true
	validates :picture, presence: true

	has_many :workers, :dependent => :destroy

	def self.worker_count(name)
		Job.find_by_name(name).workers.count	
	end

	def self.max_mabalat(name)
		worker = Job.find_by_name(name).workers.sort{|x,y| x.average_rate <=> y.average_rate}.reverse.first
	end

end