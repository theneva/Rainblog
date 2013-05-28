class ApplicationController < ActionController::Base
  	protect_from_forgery

  	helper_method :current_user

  	# Method that makes sure the user is logged in for use by the controllers
  	def login_required
  		  redirect_to(root_url, notice: 'You have to be signed in to do that! Top right ~') unless current_user
  	end

private
    # The user currently signed in
  	def current_user
        @current_user || User.find(session[:user_id]) if session[:user_id]
  	end
end
