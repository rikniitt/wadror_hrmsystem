class Faculty < ActiveRecord::Base
	has_many :departments
	
	validates_presence_of :name
	validates_length_of :name, :minimum => 10
	
	
	def to_s
		name
	end
	
end
