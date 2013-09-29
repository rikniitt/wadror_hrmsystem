class User < ActiveRecord::Base
	has_secure_password

	validates_uniqueness_of :name
	validates_length_of :name, :in => 3..15
	validates_format_of :password, :with => /\A.*[^A-z]+.*\z/, :message => "can't be all alpha"
	validates_length_of :password, :minimum => 4
	validate :distance_between_name_and_password
	
	
	def to_s
		name
	end
	
	
	def distance_between_name_and_password
		errors.add(:password, "password too similar with name") unless levenshtein_distance(name, password) >= 4
	end
	
	def levenshtein_distance(str1, str2)
		if str1.empty?
			str2.length
		elsif str2.empty?
			str1.length
		else
		  [(str1[0] == str2[0] ? 0 : 1) + levenshtein_distance(str1[1..-1], str2[1..-1]),
			1 + levenshtein_distance(str1[1..-1], str2),
			1 + levenshtein_distance(str1, str2[1..-1])].min
		end
	end
end
