class ResearchGroup < ActiveRecord::Base
	has_many :research_group_members
	has_many :members, :through => :research_group_members, :source => :employee
end
