class SessionsController < ApplicationController
  def new
  	render 'new'
  end

  def login
  	 # Obtain user's input data
  	 username = params[:username]
  	 password = params[:password]
  	 # Authenticate the user
  	 user = User.authenticate(username, password)
  	 puts "user=#{user}"
  	 # If the user authenticates, log them in
  	 if user
  	 	session = Session.create(session)
  	 	puts session
  	 else
  	 	# Show them an error message
  	 	render 'new'
  	 end
  end

  def logout
  end
end
