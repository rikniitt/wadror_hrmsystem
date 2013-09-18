class ResearchGroup < ActiveRecord::Base
	has_many :research_group_members
	has_many :members, :through => :research_group_members, :source => :employee
	
	validates_presence_of :name
	validates_length_of :name, :minimum => 2
	
	def member_count
		members.length
	end
	
	def to_s
		name
	end
end
