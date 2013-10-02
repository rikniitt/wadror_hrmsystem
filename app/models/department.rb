class Department < ActiveRecord::Base
	belongs_to :faculty
	has_many :employees
	
	validates_presence_of :name
	validates_length_of :name, :minimum => 10
	
	def to_s
		name
	end
end
