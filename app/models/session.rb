# Session management
class Session < ActiveRecord::Base
	# Creates a new session
	# Input: Session hash
	# Output: Session object
	def self.create(session) 
		session_object = nil
		if not session
			session = {}
		end
		# Check if the user's session already exists
		if session.has_key?("key")
			session_object = Session.find_by(key:session[:key])
		end

	    if not session_object
			# Generate a new key for the user
			session[:key] = SecureRandom.uuid
			session_object = Session.create(key:session[:key], user_id:-1,logged_in:false)
		end
		return session_object
	end

	# Destroys a session
	# Input: Session hash
	# Output: Session object
	def self.destroy(session)
		# Remove the session from the database 
		session_object = Session.find_by(key:session[:key])
		if session_object 
			session_object.destroy 
		end 
		# Reset the key in the session
		session[:key] = :invalid
	end
end
