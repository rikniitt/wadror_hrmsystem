class Employee < ActiveRecord::Base
	belongs_to :room
	belongs_to :department
end
