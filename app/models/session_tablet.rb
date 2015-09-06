# Session management
class SessionTablet < ActiveRecord::Base
	# Creates a new session
	# Input: Key
	# Output: SessionTablet object
	def self.make(key) 
		# Check if the user's session already exists
		session_object = SessionTablet.find_by(key:key)
		# If it doesn't exist create it
	    if not session_object 
			session_object = SessionTablet.create(key:key, user_id:-1,logged_in:false)
		end
		return session_object
	end

	# Destroys a session
	# Input: Key
	# Output: None
	def self.demolish(key)
		# Remove the session from the database 
		session_object = SessionTablet.find_by(key:key)
		if session_object 
			session_object.destroy 
		end 
	end
end
