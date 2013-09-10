class Department < ActiveRecord::Base
	has_many :employees
	
	def to_s
		name
	end
end
