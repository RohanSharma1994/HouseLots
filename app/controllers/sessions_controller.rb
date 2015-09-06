class SessionsController < ApplicationController
  def index
    @session_object = manage_session
    if @session_object.logged_in
      flash[:notice] = "You have successfully logged in!"
    end
  end

  def login
    @session_object = manage_session
    # Obtain user's input data
  	username = params[:username]
  	password = params[:password]
  	# Authenticate the user
  	user = User.authenticate(username, password)
  	# If the user authenticates, log them in
    if user
  	 	@session_object.logged_in = true
      @session_object.save
      flash[:notice] = "You have logged in successfully"
  	else
  	 	# Show them an error message
      flash[:notice] = "Invalid username & password."  	 
    end
     render 'index'
  end

  def logout
    # Log the user out by destroying their session 
    SessionTablet.demolish(session[:key])
    flash[:notice] = "You have successfully logged out"
    redirect_to action:index
  end
end
