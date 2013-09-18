class Employee < ActiveRecord::Base
	belongs_to :room
	belongs_to :department
	has_many :research_group_members, :dependent => :destroy
	has_many :research_groups, :through => :research_group_members
	
	
	def to_s
		firstname + " "  + lastname
	end
		
end

