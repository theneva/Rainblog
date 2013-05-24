module UsersHelper
	def get_username_by_id id
		User.find(id).username
	end

	def get_user_by_id id
		User.find id
	end
end
