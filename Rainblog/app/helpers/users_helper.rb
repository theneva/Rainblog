module UsersHelper
	def get_user_by_id id
		User.find id
	end
end
