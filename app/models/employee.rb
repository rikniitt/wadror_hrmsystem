class Employee < ActiveRecord::Base
	belongs_to :room
	belongs_to :department
	has_many :research_group_members, :dependent => :destroy
	has_many :research_groups, :through => :research_group_members
	
	validates_presence_of :firstname
	validates_format_of :firstname, :with => /\A[a-zA-Z]+\z/, :message => "can only contain letters"
	validates_length_of :firstname, :minimum => 2
	validates_presence_of :lastname
	validates_format_of :lastname, :with => /\A[a-zA-Z]+\z/, :message => "can only contain letters"
	validates_length_of :lastname, :minimum => 2
	validates_numericality_of :telephone
	validates_length_of :telephone, :in => 6..15
	
	def to_s
		firstname + " "  + lastname
	end
		
end


