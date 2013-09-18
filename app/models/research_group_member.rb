class ResearchGroupMember < ActiveRecord::Base
	belongs_to :employee
	belongs_to :research_group
end
