class ApplicationController < ActionController::Base
  	protect_from_forgery

  	helper_method :current_user

  	# Method that makes sure the user is logged in for use by the controllers
  	def login_required
  		redirect_to(root_url, notice: 'You have to be signed in to do that!') unless current_user
  	end

  	#def own_profile_required user_id
  	#	redirect_to(root_url, notice: 'You have to be signed in to that profile to do that!') unless current_user && current_user.id == user_id
  	#end

private

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
end
