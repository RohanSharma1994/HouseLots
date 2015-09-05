# Libraries required
require 'bcrypt'

class User < ActiveRecord::Base
	before_save :hash_password

	# Authenticates the user's identity
	# Input: Username/email & Password
	# Output: Either a User object or nil
	def self.authenticate(username_or_email, password)
		# Username authentication
		user = User.find_by(username:username_or_email)
		# Email authentication
		if not user
			user = User.find_by(email:username_or_email)
		end
		
		if user 
			# Check if the password matches and if so, return the user
			if BCrypt::Password.new(user.password) == password
				return user
			end
		end
		return nil
	end
	
	private
		def hash_password 
			self.password = BCrypt::Password.create(self.password)
		end
end
