class Room < ActiveRecord::Base
	has_many :employees
	
	validates_presence_of :name
	validates_format_of :name, :with => /\A[A-Z]{1,2}[0-9]{3}\z/, :message => "can only contain uppercase letters and numbers"
	validates_length_of :name, :in => 4..5
	
	def to_s
		name
	end
end
