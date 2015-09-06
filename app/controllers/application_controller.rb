class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def manage_session 
  	if (not session.has_key?(:key))
  	  # The session does not have the key, so create one
  	  session[:key] = SecureRandom.uuid
  	end
  	# Return the sessiontable object
  	SessionTablet.make(session[:key])
  end
end
