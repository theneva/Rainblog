class SessionsController < ApplicationController

	def new
	end

	def create

		# Let's ignore case in username, shall we?
		user = User.find(:first, conditions: [ 'lower(username) = ?', params[:username].downcase ])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to :back
		else
			redirect_to :back, :alert => "Invalid username or password"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to :back
	end

end