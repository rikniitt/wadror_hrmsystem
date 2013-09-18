class User < ActiveRecord::Base
	has_secure_password

	validates_uniqueness_of :name
	validates_length_of :name, :in => 3..15
	validates_format_of :name, :with => /\A.*[^A-z]+.*\Z/, :message => "can't be all alpha"
	validates_length_of :password, :minimum => 4
	
	def to_s
		name
	end
	
end
