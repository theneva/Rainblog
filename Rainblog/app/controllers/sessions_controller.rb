class SessionsController < ApplicationController

	def new
	end

	def create

		# Let's ignore case in username, shall we?
		user = User.find(:first, conditions: [ 'lower(username) = ?', params[:username].downcase ])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Logged in"
		else
			flash.now.alert = "Invalid email or password"
			render new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out"
	end

end